import 'dart:developer';

import 'package:choreless/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

// class RequestDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: Map(),
//     );
//   }
// }

class GMap extends StatefulWidget {
  String str;

  GMap({
    Key? key,
    required this.str,
  }) : super(key: key);
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  var date = DateTime.now();
  var fromdate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  late TextEditingController _eventController;
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('id-1'),
        position: LatLng(40.2, -8.4),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _eventController = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Application'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: [
            _divider("Details"),
            Container(
              width: 200,
              height: 150,
              child: Image(
                image: AssetImage('assets/pool.jpg'),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.fromLTRB(35, 5, 35, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  color: Colors.orange.shade100),
              child: Text(
                  ' Big pool, I have all the equipments required to clean.\n Can be done any day of the week.\n Price is not negotiable.'),
            ),
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(35, 5, 300, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  color: Colors.orange.shade100),
              child: Text('50€'),
            ),
            _divider('Map'),
            Container(
                margin: EdgeInsets.fromLTRB(50, 10, 50, 50),
                child: SizedBox(
                    width: 500, // or use fixed size like 200
                    height: 300,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      markers: _markers,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(40.2, -8.4),
                        zoom: 15,
                      ),
                    ))),
            _divider("Reviews"),
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.fromLTRB(35, 5, 35, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  color: Colors.orange.shade100),
              child: Text(' Reviews'),
            ),
          ],
        ),
        floatingActionButton: SafeArea(
            child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 30,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfileViewOnly(str: widget.str)));
                },
                label: const Text('Info'),
                icon: const Icon(Icons.person_search),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () {
                  _showAddDialog();
                },
                label: const Text('interested'),
                icon: const Icon(Icons.thumb_up),
                backgroundColor: Colors.indigoAccent,
              ),
            ),
          ],
        )));
  }

  _divider(input) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
      Text(input),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
    ]);
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Your Price:'),
                    controller: _eventController,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Coin:'),
                  ),
                  Card(
                    child: FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            setState(() {
                              print('confirm $date');
                              fromdate = DateFormat('yyyy-MM-dd').format(date);
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Row(children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.indigo,
                          ),
                          Text(
                            fromdate,
                            style: TextStyle(color: Colors.indigo),
                          )
                        ])),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                FlatButton(
                    onPressed: () {
                      if (_eventController.text.isEmpty) return;
                      setState(() {});

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.greenAccent,
                        content: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                'Added!',
                                style: TextStyle(
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.green.shade900,
                            ),
                          ],
                        ),
                        duration: const Duration(milliseconds: 1000),
                        width: 280.0, // Width of the SnackBar.
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              8.0, // Inner padding for SnackBar content.
                        ),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ));

                      Navigator.pop(context);
                    },
                    child: Text('Save'))
              ],
            ));
  }
}
