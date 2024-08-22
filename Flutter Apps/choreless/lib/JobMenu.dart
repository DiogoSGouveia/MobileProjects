import 'package:choreless/JobDetails.dart';
import 'package:choreless/profile.dart';
import 'package:flutter/material.dart';

class JobMenu extends StatefulWidget {
  @override
  _JobMenuState createState() => _JobMenuState();
}

class _JobMenuState extends State<JobMenu> {
  late List<dynamic> _jobs;

  @override
  void initState() {
    super.initState();

    _jobs = [
      ['Need someone to clean my pool', 'assets/duck.jpg'],
      ['Need someone to trim my bushes', 'assets/chita.jpg'],
      ['Need someone to take the trash out', 'assets/racoon.jpg'],
      ['Need someone to water my plants', 'assets/bear.jpg']
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Application'),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/dog.jpg'), fit: BoxFit.cover),
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
        body: Column(
          children: <Widget>[
            _filterSearch(),
            Divider(),
            new Expanded(
                child: new ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _jobs.length,
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  margin: EdgeInsets.all(5),
                  height: 75,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GMap(str: _jobs[index][1])));
                    },
                    minWidth: 300,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Row(children: [
                      _profileIcon(_jobs[index][1]),
                      VerticalDivider(),
                      Text(_jobs[index][0]),
                      VerticalDivider(),
                    ]),
                    color: Colors.amber,
                  ),
                );
              },
            ))
          ],
        ));

    //  ListView(children: [
    //   _filterSearch(),
    //   Divider(),
    //   _jobSelect('Need someone to clean my pool', 'assets/duck.jpg'),
    //   _jobSelect('Need someone to trim my bushes', 'assets/chita.jpg'),
    //   _jobSelect('Need someone to take the trash out', 'assets/racoon.jpg'),
    //   _jobSelect('Need someone to water my plants', 'assets/bear.jpg'),
    // ]));
  }

  _filterSearch() {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.calendar_today_rounded), onPressed: () {}),
        Container(
          width: 100,
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            onPressed: () {},
            child: Text('Tags'),
          ),
        ),
        Container(
          width: 150,
          margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.indigoAccent,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            onPressed: () {},
            child: Text('Filter'),
          ),
        ),
      ],
    );
  }

  _profileIcon(img) {
    return CircleAvatar(
      backgroundImage: AssetImage(
        img,
      ),
      radius: 30,
    );
  }
}
