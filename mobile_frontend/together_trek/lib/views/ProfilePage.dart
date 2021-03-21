import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together_trek/models/UserModel.dart';
import 'package:together_trek/views/ProfileInfoView.dart';
import 'package:together_trek/views/EditPRofilePage.dart';
import 'package:together_trek/views/ProfileInfoView.dart';

dynamic first = 'Neil';
dynamic last = 'Armstrong';
dynamic destination = 'The Moon';
dynamic date = '8/5/1930';
dynamic bio = 'One small step for man, one giant leap for mankind';
dynamic gender = 'Male';

class ProfilePage extends StatelessWidget {
  Future navigateToEditProfilePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfilePage()));
  }

  UserModel user;
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.redAccent, Colors.orangeAccent]
              )
            ),
            child: Container(
              width: double.infinity,
              height: 320.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: user.profilePic,
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      user.username,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                      Text(
                        first + " " + last,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Gender",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      this.user.gender,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.orangeAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Travelling to",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      destination,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.orangeAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Birthdate",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      date,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.orangeAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bio:",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    bio,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 330,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                ),
                Container(
                  width: 300.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.pexels.com/photos/41952/neil-armstrong-armstrong-astronaut-space-suit-41952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                )
              ])),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {
                  navigateToEditProfilePage(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 1.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.redAccent, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
