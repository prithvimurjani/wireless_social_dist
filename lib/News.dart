import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class News extends StatefulWidget {
  static const String id = "News";
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  DatabaseReference ref =
      FirebaseDatabase.instance.reference().child('/TODAY/News');
  final DBRef = FirebaseDatabase.instance.reference();
  List listsLocation = [];
  List listsStatus = [];
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                // resizeToAvoidBottomInset: true,
                backgroundColor: Colors.white,
                body: ModalProgressHUD(
                  inAsyncCall: showSpinner,
                  progressIndicator: SpinKitFadingGrid(
                    color: Colors.white,
                    size: 50.0,
                  ),
                  child: ListView(
                    children: <Widget>[
                      FutureBuilder(
                          future: ref.once(),
                          builder:
                              (context, AsyncSnapshot<DataSnapshot> snapshot) {
                            if (snapshot.hasData) {
                              //  print(snapshot.data.value);
                              listsLocation.clear();
                              listsStatus.clear();

                              Map<dynamic, dynamic> values =
                                  snapshot.data.value;
                              values.forEach((k, v) {
                                listsLocation.add(k);
                                listsStatus.add(v);
                                print(k);
                                print(v);
                                print(listsLocation);
                                print(listsStatus);
                              });

                              return ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: listsLocation.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 90,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              16,
                                          decoration: BoxDecoration(
                                              //border:
                                              // Border.all(color: kPinkColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          //color: kPinkColor,
                                          child: Card(
                                            color: kPinkColor,
                                            child: Center(
                                              child: Column(
                                                // physics:
                                                //     NeverScrollableScrollPhysics(),
                                                children: [
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    listsLocation[index]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    height: 14,
                                                  ),
                                                  Text(
                                                    listsStatus[index]
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        // FitCardBig(parameter: 'TEMPERATURE',concurrentdata: lists[0].toString(),iconparam: Icon(Icons.healing), ),
                                        // FitCardBig(parameter: 'DISTANCE',concurrentdata: lists[1].toString(),iconparam: Icon(Icons.alarm_on), ),
                                      ],
                                    );
                                  });
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 65.0),
                        child: MaterialButton(
                          //minWidth: 30,
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
                          },
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
