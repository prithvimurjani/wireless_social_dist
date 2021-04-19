import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class SensorData extends StatefulWidget {
  static const String id = "SensorData";
  @override
  _SensorDataState createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  DatabaseReference ref = FirebaseDatabase.instance.reference().child('/TODAY');
  final DBRef = FirebaseDatabase.instance.reference();
  List lists = [];
  bool showSpinner = false;

  void getSensorData() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Image.asset(
                                          'wireless_images/index.jpeg',
                                          scale: 2,
                                        ),
                                        SizedBox(
                                          height: 75,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: RotatedBox(
                                                quarterTurns: 1,
                                                child: Image.asset(
                                                  'wireless_images/index.jpeg',
                                                  scale: 2,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: RotatedBox(
                                                quarterTurns: 3,
                                                child: Image.asset(
                                                  'wireless_images/index.jpeg',
                                                  scale: 2,
                                                ),
                                              ),
                                            ),
                                          ],
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
                        height: 50.0,
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
