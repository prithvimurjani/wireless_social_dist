import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SensorData extends StatefulWidget {
  static const String id = "SensorData";
  @override
  _SensorDataState createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  DatabaseReference ref = FirebaseDatabase.instance.reference().child('/TODAY');
  final DBRef = FirebaseDatabase.instance.reference();
  List lists = [];
  int number = 0;
  int currentCount = 0;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: ModalProgressHUD(
                  inAsyncCall: showSpinner,
                  progressIndicator: SpinKitFadingGrid(
                    color: Colors.white,
                    size: 50.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                          future: ref.once(),
                          builder:
                              (context, AsyncSnapshot<DataSnapshot> snapshot) {
                            if (snapshot.hasData) {
                              //  print(snapshot.data.value);
                              lists.clear();

                              Map<dynamic, dynamic> values =
                                  snapshot.data.value;
                              values.forEach((k, v) {
                                lists.add(values[k]);
                                print(k);
                                print(v);
                                print(lists);
                              });
                              currentCount = lists[1];
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            color: kPinkColor,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                FitCardBig(
                                                  parameter:
                                                      'Count at Big Bazaar',
                                                  concurrentdata:
                                                      lists[1].toString(),
                                                  iconparam: Icon(Icons.people),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Text(
                                                  'Set limit',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    FloatingActionButton(
                                                        backgroundColor:
                                                            Colors.black,
                                                        child: Icon(
                                                          AntDesign.minus,
                                                          color: kPinkColor,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            number = number - 1;
                                                          });
                                                        }),
                                                    Text(
                                                      number.toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    FloatingActionButton(
                                                        backgroundColor:
                                                            Colors.black,
                                                        child: Icon(
                                                          AntDesign.plus,
                                                          color: kPinkColor,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            number = number + 1;
                                                          });
                                                        }),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Text(
                                                  (currentCount > number)
                                                      ? 'Warning!! Limit crossed!!'
                                                      : 'Safe to visit',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Row(
                                        //       children: [
                                        //         Padding(
                                        //           padding:
                                        //               const EdgeInsets.only(
                                        //                   left: 8.0),
                                        //           child: RotatedBox(
                                        //             quarterTurns: 1,
                                        //             child: Image.asset(
                                        //               'wireless_images/index.jpeg',
                                        //               scale: 2,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           width: 5,
                                        //         ),
                                        //         RotatedBox(
                                        //           quarterTurns: 1,
                                        //           child: Container(
                                        //             decoration: BoxDecoration(
                                        //                 border: Border.all(
                                        //                     color: kPinkColor),
                                        //                 borderRadius:
                                        //                     BorderRadius.all(
                                        //                         Radius.circular(
                                        //                             15))),
                                        //             //color: kPinkColor,
                                        //             child: Text(
                                        //               '  ' +
                                        //                   lists[0].toString() +
                                        //                   ' cm away  ',
                                        //               style: TextStyle(
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   fontSize: 18),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        // Row(
                                        //   children: [
                                        //     RotatedBox(
                                        //       quarterTurns: 3,
                                        //       child: Container(
                                        //         decoration: BoxDecoration(
                                        //             border: Border.all(
                                        //                 color: kPinkColor),
                                        //             borderRadius:
                                        //                 BorderRadius.all(
                                        //                     Radius.circular(
                                        //                         15))),
                                        //         //color: kPinkColor,
                                        //         child: Text(
                                        //           '  ' +
                                        //               lists[4].toString() +
                                        //               ' cm away  ',
                                        //           style: TextStyle(
                                        //               fontWeight:
                                        //                   FontWeight.bold,
                                        //               fontSize: 18),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Padding(
                                        //       padding:
                                        //           const EdgeInsets.only(
                                        //               right: 8.0),
                                        //       child: RotatedBox(
                                        //         quarterTurns: 3,
                                        //         child: Image.asset(
                                        //           'wireless_images/index.jpeg',
                                        //           scale: 2,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],

                                      // FitCardBig(parameter: 'TEMPERATURE',concurrentdata: lists[0].toString(),iconparam: Icon(Icons.healing), ),
                                      // FitCardBig(parameter: 'DISTANCE',concurrentdata: lists[1].toString(),iconparam: Icon(Icons.alarm_on), ),
                                    );
                                  });
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(
                        height: 150.0,
                      ),
                      MaterialButton(
                        color: Colors.black,
                        child: Text(
                          "Tap to refresh",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        highlightColor: kPinkColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          setState(() {
                            this.widget;
                          });
                          //Navigator.pushNamed(context, CommonScreen.id);
                        },
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}

class FitCardBig extends StatelessWidget {
  FitCardBig({this.parameter, this.concurrentdata, this.iconparam});

  final String parameter;
  final String concurrentdata;
  final Icon iconparam;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              parameter.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              concurrentdata.toString(),
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Icon(
              iconparam.icon,
              color: kPinkColor,
              size: 24.0,
            ),
          ),
        ],
      ),
      width: 340.0,
      height: 145.0,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      decoration: BoxDecoration(
        //   boxShadow: [BoxShadow(color: Colors.white,spreadRadius: 1.0,)],
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.blueAccent, width: 0.0, style: BorderStyle.solid),
      ),
    );
  }
}
