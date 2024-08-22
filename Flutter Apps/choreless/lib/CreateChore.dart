import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Chores extends StatefulWidget {
  @override
  _ChoresState createState() => _ChoresState();
}

class _ChoresState extends State<Chores> {
  var fromdate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var todate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var date = DateTime.now();
  late Map<DateTime, List<dynamic>> _events;
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _events = {};
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString('events') ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Create a Chore'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
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
                Text('-to-'),
                Card(
                  child: FlatButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: date,
                            maxTime: DateTime(2025, 6, 7), onChanged: (fdate) {
                          print('change $fdate');
                        }, onConfirm: (fdate) {
                          setState(() {
                            print('confirm $fdate');
                            todate = DateFormat('yyyy-MM-dd').format(fdate);
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Row(children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.indigo,
                        ),
                        Text(
                          todate,
                          style: TextStyle(color: Colors.indigo),
                        )
                      ])),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/placeholder.png'),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                child: TextFormField(
                    autofocus: false,
                    maxLines: 4,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    )),
              )),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 75,
            child: DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItem: true,
                items: [
                  "Rua Sao Teotonio",
                  "Praca da Republica",
                  "Rua Chao do Bispo",
                ],
                label: "Address",
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: print,
                selectedItem: "Select Address..."),
          ),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 100,
                child: TextFormField(
                    autofocus: false,
                    maxLines: 1,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    )),
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
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
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ));
        },
        label: const Text('Create'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.orangeAccent,
      ),
    );
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
}
