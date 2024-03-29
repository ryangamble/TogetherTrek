import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:together_trek/api/TripWrapper.dart';
import 'package:together_trek/api/ExpenseWrapper.dart';
import 'package:together_trek/api/httpRequest.dart';
import 'package:together_trek/models/LoadedTripsModel.dart';
import 'package:together_trek/models/LoadedExpensesModel.dart';
import 'package:together_trek/models/TripModel.dart';
import 'package:together_trek/models/UserModel.dart';
import 'package:together_trek/models/ExpenseModel.dart';
import 'package:together_trek/models/ExpenseBodyModel.dart';
import 'package:together_trek/utils/DialogUtil.dart';
import 'package:together_trek/views/AddExpenseView.dart';
//import 'package:together_trek/views/AlertView.dart';
import 'package:together_trek/views/HomeView.dart';
import 'package:together_trek/views/TempProfileView.dart';
import 'package:together_trek/views/TripPhotosView.dart';

class TripView extends StatefulWidget {
  TripView({Key key, this.trip}) : super(key: key);

  TripModel trip;

  _TripViewState createState() => _TripViewState(trip: trip);
}

class _TripViewState extends State<TripView> {
  _TripViewState({this.trip});
  TripModel trip;
  UserModel user;
  List data;
  //LoadedExpensesModel expensesList;

  // Future<List<ExpenseModel>> expensesL = getExpenses();

  //   void _saveExpenses(List<ExpenseModel> expenses) {
  //   this.expensesList.resetExpenses(expenses);
  //   return;
  // }
//<<<<<<< HEAD
  bool leaveVisible = true;
  bool requestVisible = true;
  void hideLeaveWidget() {
    /*UserModel */ user = context.read<UserModel>();
    setState(() {
      print(trip.participantIds);
      if (leaveVisible) {
        leaveVisible = trip.participantIds.indexOf(user.id) != -1;
      } else {
        leaveVisible = false;
      }
    });
  }

  void hideRequestWidget() {
    /*UserModel */ user = context.read<UserModel>();
    setState(() {
      if (requestVisible) {
        requestVisible = trip.joinRequests.indexOf(user.id) == -1 &&
            trip.participantIds.indexOf(user.id) == -1;
        if (requestVisible) {
          leaveVisible = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    user = context.read<UserModel>();
    user = context.read<UserModel>();
    Future<List<ExpenseModel>> expenses = getExpenses();
    Future<List<ExpenseModel>> foodExpenses = getFoodExpenses(trip.id);
    Future<List<ExpenseModel>> housingExpenses = getHousingExpenses(trip.id);
    Future<List<ExpenseModel>> transpExpenses = getTranspExpenses(trip.id);
    Future<List<ExpenseModel>> otherExpenses = getOtherExpenses(trip.id);
    hideLeaveWidget();
    hideRequestWidget();
    if (trip.participantIds.contains(user.id)) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Trip"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Start Date:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.startDate.substring(0, 10),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "End Date:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.endDate.substring(0, 10),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Destination:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.destination.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),

            // Flexible(
            //     child: FutureBuilder(
            //         future: expenses,
            //         builder: (context, snapshot) {
            //           if (!snapshot.hasData) {
            //             return Center(child: CircularProgressIndicator());
            //           } else {
            //             return Container(
            //                 child: ListView.builder(
            //                     itemCount: snapshot.data.length,
            //                     scrollDirection: Axis.vertical,
            //                     itemBuilder: (BuildContext context, int index) {
            //                       return Text('${snapshot.data[index].category}');
            //                     }));
            //           }
            //         })),

/*<<<<<<< HEAD
            Text("food"),
=======*/
            Text(
              "Food:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
//>>>>>>> main
            Flexible(
                child: FutureBuilder(
                    future: foodExpenses,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                      '${snapshot.data[index].toString()}');
                                }));
                      }
                    })),
/*<<<<<<< HEAD
            Text("housing"),
=======*/
            Text(
              "Housing:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
//>>>>>>> main
            Flexible(
                child: FutureBuilder(
                    future: housingExpenses,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                      '${snapshot.data[index].toString()}');
                                }));
                      }
                    })),
/*<<<<<<< HEAD
            Text("transportation"),
=======*/
            Text(
              "Transportation:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
//>>>>>>> main
            Flexible(
                child: FutureBuilder(
                    future: transpExpenses,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                      '${snapshot.data[index].toString()}');
                                }));
                      }
                    })),
/*<<<<<<< HEAD
            Text("other"),
=======*/
            Text(
              "Other:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
//>>>>>>> main
            Flexible(
                child: FutureBuilder(
                    future: otherExpenses,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                      '${snapshot.data[index].toString()}');
                                }));
                      }
                    })),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Budget:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.budget.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Total Expenses:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.total_expenses.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Expense Per Person:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.expense_per_person.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TripPhotosView(trip)));
                  },
                  child: Text('View Photos'),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddExpenseView(trip)));
                  },
                  child: Text('Add Expense'),
                )),
            (requestVisible &&
                    true /*(trip.participantIds).indexOf(user.id) == -1*/)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        requestJoinTrip(context, trip.id);
                        hideRequestWidget();
                        setState(() {
                          requestVisible = false;
                        });
                      },
                      child: Text('Request to join'),
                    ))
                : Container(),
            leaveVisible
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        requestRemoveFromTrip(
                            context, trip.id, user.id, user.id);
                        hideLeaveWidget();
                        setState(() {
                          leaveVisible = false;
                        });
                      },
                      child: Text('Leave Trip'),
                    ))
                : Container(),
            Text(
              "invite user:",
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Trip"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Start Date:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 28.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.startDate.substring(0, 10),
              style: TextStyle(
                fontSize: 22.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "End Date:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 28.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.endDate.substring(0, 10),
              style: TextStyle(
                fontSize: 22.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Destination:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 28.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.destination.toString(),
              style: TextStyle(
                fontSize: 22.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Budget:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              trip.budget.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    requestJoinTrip(context, trip.id);
                  },
                  child: Text('Request to join'),
                ))*/
            (requestVisible &&
                    true /*(trip.participantIds).indexOf(user.id) == -1*/)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        requestJoinTrip(context, trip.id);
                        hideRequestWidget();
                        setState(() {
                          requestVisible = false;
                        });
                      },
                      child: Text('Request to join'),
                    ))
                : Container(),
            leaveVisible
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        requestRemoveFromTrip(
                            context, trip.id, user.id, user.id);
                        hideLeaveWidget();
                        setState(() {
                          leaveVisible = false;
                        });
                      },
                      child: Text('Leave Trip'),
                    ))
                : Container()
          ],
        ),
      );
    }
//>>>>>>> main
  }
}
