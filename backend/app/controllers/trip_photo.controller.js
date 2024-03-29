const path = require('path');

const db = require("../models/index.js");
const s3_handler = require("../utils/s3_handler.js");

const Trip_Photo = db.trip_photos;
const User = db.users;
const Trip = db.trips;


// Creates an entry in the trip_photos table
exports.create = (req, res) => {
  // Validate all expected fields were passed
  if (!req.body.author_id) {
    res.status(400).send({ message: "author_id can not be empty." });
    return;
  }
  const author_id = req.body.author_id;

  if (!req.body.trip_id) {
    res.status(400).send({ message: "trip_id can not be empty." });
    return;
  }
  const trip_id = req.body.trip_id;

  if (!req.files || !req.files.file) {
    res.status(400).send({ message: "file can not be empty." });
    return;
  }
  const file = req.files.file;

  // Validate reference keys exist
  const user = User.findById(author_id);
  if (!user) {
    res.status(404).send({
      message: `User with id=${author_id} not found.`
    });
    return;
  }
  const trip = Trip.findById(trip_id);
  if (!trip) {
    res.status(404).send({
      message: `Trip with id=${trip_id} not found.`
    });
    return;
  }

  // Validate file is an image
  if (!file.mimetype.startsWith('image') && !file.mimetype.startsWith('application/octet-stream')) {
    res.status(400).send({ message: "file must be type image." });
    return;
  }

  // Create a trip_photo object
  const trip_photo = new Trip_Photo({
    author_id: author_id,
    post_date: Date.now(),
    trip_id: trip_id
  });

  // Save the trip_photo to the database
  let trip_photo_id;
  trip_photo
  .save(trip_photo)
  .then(async data => {
    trip_photo_id = data.id
    file.name = `${trip_photo_id}${path.parse(file.name).ext}`

    // Update the trip_photo filename with the new filename
    trip_photo.filename = file.name;
    await trip_photo.save()
    .catch(err => {
      trip_photo.delete();
      res.status(500).send({
        message: err.message || "Failed to update Trip_Photo."
      });
      return;
    });

    // Upload the file to S3
    await s3_handler.upload(file)
    .catch(err => {
      trip_photo.delete();
      res.status(500).send({
        message: err.message || "Failed to upload image."
      });
      return;
    });

    // Return the trip_photo id to the user
    res.send(trip_photo_id);
    return;
  })
  .catch(err => {
    if (trip_photo_id) {
      trip_photo.delete();
    }
    res.status(500).send({
      message: err.message || "Failed to create Trip_Photo."
    });
    return;
  });
};

// Retrieves an entry from the trip_photos table by id
exports.findOne = (req, res) => {
  const trip_photo_id = req.params.id;

  Trip_Photo.findById(trip_photo_id)
  .then(trip_photo => {
    if (!trip_photo) {
      res.status(404).send({
        message: `Could not find Trip_Photo with id=${trip_photo_id}.`
      });
    } else {
      const filename = trip_photo.filename;
      s3_handler.findOne(filename)
      .then(image => {
        if (!image) {
          res.status(404).send({
            message: `Could not find image.`,
          })
          return;
        }
        if (filename.includes("jpeg") || filename.includes("jpg"))
          res.writeHead(200, {'Content-Type': 'image/jpeg'});
        else
          res.writeHead(200, {'Content-Type': 'image/png'});
        res.write(image.Body, 'binary');
        res.end(null, 'binary');
        return;
      })
      .catch(err => {
        res.status(500).send({
          message: err.message || "Failed to find photo."
        });
        return;
      });
    }
  })
  .catch(err => {
    res.status(500).send({
      message: `Error retrieving Trip_Photo with id=${trip_photo_id}.`
    });
  });
}

// Retrieves entries from the trip_photos table by search criteria
exports.findAll = (req, res) => {

}

exports.findAllId = (req, res) => {
  let requirements = req.query
  let id = req.params.id

  let found_photos
  Trip_Photo.find({ trip_id: `${id}` })
    .then(async (data) => {
      let num_photos = data.length
      found_photos = []
      if (num_photos == 0) {
        res.send(data)
      } else {
        for (i = 0; i < num_photos; i++) {
          let photo = data[i]
          found_photos.push(photo)
        }
        res.send(found_photos)
      }
      return
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || 'Some error occurred while retrieving photos',
      })
      return
    })
}

// Updates an entry in the trip_photos table by id
exports.update = (req, res) => {

}

// Deletes an entry in the trip_photos table by id
exports.delete = (req, res) => {
  const trip_photo_id = req.params.id;

  // Get the trip_photo object so we can delete the image
  Trip_Photo.findById(trip_photo_id)
  .then(data => {
    if (!data) {
      res.status(404).send({
        message: `Could not find Trip_Photo with id=${trip_photo_id}.`
      });
    } else {
      // Delete the image from S3
      const filename = data.filename;
      s3_handler.delete(filename)
      .catch(errr => {
        res.status(500).send({
          message: err.message || "Failed to delete image."
        });
        return;
      });

      // Delete the trip_photo entry in the database
      data.delete();
      res.send("success");
      return;
    }
  })
  .catch(err => {
    res.status(500).send({
      message: `Error retrieving Trip_Photo with id=${trip_photo_id}.`
    });
  });
}
