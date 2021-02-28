import 'package:TogetherTrek/models/LocationModel.dart';
import 'package:TogetherTrek/models/ProfilePicModel.dart';
import 'package:flutter/material.dart';

/* 
  This is the UserModel class for the application. It defines how all data will
  be stored for a user. Theoretically, some of these fields will only be filled
  if, and only if, the user that was retrieved from the server is the currently
  logged-in user.
*/

class UserModel extends ChangeNotifier {
  String id;
  String username;
  String email;
  String birthdate;
  String gender;
  String firstName;
  String lastName;
  ProfilePicModel profilePic;
  bool verified;
  bool notificationsEnabled;
  bool locationEnabled;
  List<String> postIds;
  List<String> tripIds;
  List<String> messageBoardIds;
  List<String> friendIds;
  LocationModel location;

  UserModel(
      String id,
      String username,
      String email,
      String birthdate,
      String gender,
      String firstName,
      String lastName,
      ProfilePicModel profilePic,
      bool verified,
      bool notificationsEnabled,
      bool locationEnabled,
      List<String> postIds,
      List<String> tripIds,
      List<String> messageBoardIds,
      List<String> friendIds,
      LocationModel location) {
    // the date needs to be parsed
    this.id = id;
    this.username = username;
    this.email = email;
    this.birthdate = birthdate;
    this.gender = gender;
    this.firstName = firstName;
    this.lastName = lastName;
    this.profilePic = profilePic;
    this.verified = verified;
    this.notificationsEnabled = notificationsEnabled;
    this.locationEnabled = locationEnabled;
    this.postIds = postIds;
    this.tripIds = tripIds;
    this.messageBoardIds = messageBoardIds;
    this.friendIds = friendIds;
    this.location = location;

    notifyListeners();
  }
}
