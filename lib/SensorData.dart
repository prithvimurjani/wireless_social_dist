import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      home: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.black,
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

                            Map<dynamic, dynamic> values = snapshot.data.value;
                            values.forEach((k, v) {
                              lists.add(values[k]);
                              print(k);
                              print(v);
                            });

                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    color: Colors.black,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        // FitCardBig(parameter: 'TEMPERATURE',concurrentdata: lists[0].toString(),iconparam: Icon(Icons.healing), ),
                                        // FitCardBig(parameter: 'DISTANCE',concurrentdata: lists[1].toString(),iconparam: Icon(Icons.alarm_on), ),
                                      ],
                                    ),
                                  );
                                });
                          }
                          return CircularProgressIndicator();
                        }),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      height: 75.0,
                      width: 200.0,
                      child: MaterialButton(
                        color: Colors.blueAccent,
                        child: Text(
                          'PUSH LOCATION',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onPressed: () {
                          //checker();
                        },
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
