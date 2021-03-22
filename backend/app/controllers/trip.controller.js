const db = require("../models/index.js");
const Trip = db.trips;
const User = db.users;

// Creates an entry in the trips table
exports.create = (req, res) => {
 // Validate all expected fields were passed
 if (!req.body) {
    res.status(400).send({ message: "no body." });
    return;
  }
  if (!req.body.destination) {
    res.status(400).send({ message: "destination can not be empty." });
    return;
  }
  if (!req.body.start_date) {
    res.status(400).send({ message: "start date can not be empty." });
    return;
  }
  if (!req.body.end_date) {
    res.status(400).send({ message: "end date can not be empty." });
    return;
  }
  if (!req.body.creator_id) {
    res.status(400).send({ message: "creator id can not be empty." });
    return;
  }
  if (!req.body.participant_ids) {
    res.status(400).send({ message: "participants can not be empty." });
    return;
  }

  const trip = new Trip({
    destination: req.body.destination,
    start_date: req.body.start_date,
    end_date: req.body.end_date,
    creator_id: req.body.creator_id,
    participant_ids: req.body.participant_ids
  });

  trip
  .save(trip)
  .then(async (data) => {
    var user = await User.findById(req.body.creator_id)
    if (!user) {
        res.status(500).send({ message: "Could not update user." })
    }
    user.trip_ids.push(data.id)
    User.findByIdAndUpdate(req.body.author_id, user, { useFindAndModify: false })
      .then((data) => {
          if (!data) {
              res.status(404).send({ message: `Could not find User with id=${id}.` })
          } else {
              res.send({ message: 'User was updated successfully!' })
          }
      })
      .catch((err) => {
          res.status(500).send({ message: `Error retrieving User with id=${id}.` })
      })
    res.send(data.id);
  })
  .catch(err => {
    res.status(500).send({
      message:
        err.message || "Some error occurred while creating the Trip."
    });
  });
};

// Retrieves an entry from the trips table by id
exports.findOne = (req, res) => {
    const id = req.params.id;
  
    Trip.findById(id)
      .then(data => {
        if (!data) {
          res.status(404).send({ message: `Could not find Trip with id=${id}.` });
        }
        else {
          res.send(data);
        }
      })
      .catch(err => {
        res
          .status(500)
          .send({ message: `Error retrieving Trip with id=${id}.` });
    });
};

// Retrieves entries from the trips table by search criteria
exports.findAll = (req, res) => {
    // Format the requirements the way mongoose expects
    let requirements = req.query;
    let condition = {};
    Object.keys(requirements).forEach(function(key) {
    condition[key] = { $regex: new RegExp(requirements[key]), $options: "i" }
    })

    // Retrieve records that match the requirements
    Trip.find(condition)
    .then(data => {
        res.send(data);
    })
    .catch(err => {
        res.status(500).send({
        message:
            err.message || "Some error occurred while retrieving trips."
        });
    });
};

// Updates an entry in the trips table by id
exports.update = (req, res) => {
    if (!req.body) {
        return res.status(400).send({
            message: "Cannot update Trip with empty data"
        })
        }

        const id = req.params.id;

        Trip.findByIdAndUpdate(id, req.body, {useFindAndModify: false})
        .then(data => {
            if (!data) {
            res.status(404).send({message: `Could not find Trip with id=${id}.`});
            }
            else {
            res.send({message: "Trip was updated successfully!"});
            }
        })
        .catch(err => {
            res
            .status(500)
            .send({message: `Error retrieving Trip with id=${id}.`});
        });
}

// Deletes an entry in the trips table by id
exports.delete = (req, res) => {
    const id = req.params.id;
  
    Trip.findByIdAndRemove(id, { useFindAndModify: false })
      .then(data => {
        if (!data) {
          res.status(404).send({
            message: `Cannot delete Trip with id=${id}. Maybe Trip was not found.`
          });
        } else {
          res.send({
            message: "Trip was deleted successfully."
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: `Could not delete Trip with id=${id}.`
        });
      });
  };
