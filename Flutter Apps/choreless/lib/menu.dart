import 'package:choreless/PickWorker.dart';
import 'package:choreless/profile.dart';
import 'PickWorker.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CalendarController _controller;
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;
  late SharedPreferences prefs;
  var _counter;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _selectedEvents = [];
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
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.indigo,
                  bottom: TabBar(indicatorColor: Colors.indigo, tabs: [
                    Tab(text: 'Your Jobs'),
                    Tab(
                      text: 'Your Chores',
                    )
                  ]),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/Notif");
                    },
                    child: Icon(
                      Icons.notifications, // add custom icons also
                    ),
                  ),
                  actions: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/dog.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            shape: CircleBorder(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileUi(str: 'assets/dog.jpg')));
                            },
                          )),
                    )
                  ],
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: <Widget>[
                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: TableCalendar(
                            events: _events,
                            headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                centerHeaderTitle: true),
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            onDaySelected: (date, events, _selectedevents) {
                              setState(() {
                                _selectedEvents = events;
                              });
                            },
                            calendarStyle: CalendarStyle(),
                            calendarController: _controller,
                          ),
                        ),
                        new Expanded(
                          child: new ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: _selectedEvents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return new Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.grey,
                                    ),
                                    child: Text(_selectedEvents[index]),
                                  ),
                                );
                              }),
                        )

                        // ..._selectedEvents.map((event) => Container(
                        //       color: Colors.grey,
                        //       child: Text(event),
                        //     )),
                      ],
                    ),
                    ListView(
                      children: [
                        _divider('Pick a Worker:'),
                        Card(
                          margin: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PickWorker(str: 'Cleaning car')));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigoAccent,
                              onPrimary: Colors.white,
                              onSurface: Colors.grey,
                            ),
                            child: Text('Cleaning car'),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PickWorker(str: 'Walking dog')));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigoAccent,
                              onPrimary: Colors.white,
                              onSurface: Colors.grey,
                            ),
                            child: Text('Walking dog'),
                          ),
                        ),
                        _divider('Finished:'),
                        Card(
                          margin: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigoAccent,
                              onPrimary: Colors.white,
                              onSurface: Colors.grey,
                            ),
                            child: Text('Painting fence'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                floatingActionButton: _getFAB())));
  }

  // void _settingModalBottomSheet(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Container(
  //           child: new Wrap(
  //             children: <Widget>[
  //               new ListTile(
  //                   leading: new Icon(Icons.construction_rounded),
  //                   title: new Text('Apply For Job'),
  //                   onTap: () => {Navigator.pushNamed(context, "/JobMenu")}),
  //               new ListTile(
  //                 leading: new Icon(Icons.edit_outlined),
  //                 title: new Text('Create a Chore'),
  //                 onTap: () => {Navigator.pushNamed(context, "/Chores")},
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      if (_eventController.text.isEmpty) return;
                      setState(() {
                        if (_events[_controller.selectedDay] != null) {
                          _events[_controller.selectedDay]!
                              .add(_eventController.text);
                        } else {
                          _events[_controller.selectedDay] = [
                            _eventController.text
                          ];
                        }
                        prefs.setString(
                            'events', json.encode(encodeMap(_events)));
                        _eventController.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Save'))
              ],
            ));
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

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Colors.orangeAccent,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.construction_rounded),
            backgroundColor: Colors.indigoAccent,
            onTap: () {
              Navigator.pushNamed(context, "/JobMenu");
            },
            label: 'Apply For Job',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.indigoAccent),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.edit_outlined),
            backgroundColor: Colors.indigoAccent,
            onTap: () {
              Navigator.pushNamed(context, "/Chores");
            },
            label: 'Create a Chore',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.indigoAccent)
      ],
    );
  }
}

// floatingActionButton: FloatingActionButton(
//   backgroundColor: Colors.orangeAccent,
//   child: Icon(Icons.add),
//   onPressed: () {
//     _settingModalBottomSheet(context);
//   },
// ),
