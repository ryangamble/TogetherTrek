
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together_trek/api/UserWrapper.dart';

import 'package:together_trek/models/UserModel.dart';
import 'package:together_trek/views/FriendListView.dart';

class FriendPageView extends StatefulWidget {
  FriendPageView({Key key}) : super(key: key);

  _FriendPageViewState createState() => _FriendPageViewState();
}

class _FriendPageViewState extends State<FriendPageView> {
  UserModel user;
  UserModel current;

  @override
  Widget build(BuildContext context) {
    user = context.watch<UserModel>();
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text("My Friends")),
        body: Container(child: Text("Invalid User")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: this.user.friendIds.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () async {
                      current = await getUser(user.friendIds[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendListView(
                                  user: current)));
                    },
                    child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Text(this.user.friendIds[index])));
              })),
    );
  }
}
