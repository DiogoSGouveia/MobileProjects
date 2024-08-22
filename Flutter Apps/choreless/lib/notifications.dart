import 'package:choreless/JobDetails.dart';
import 'package:choreless/profile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choreless',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Notif(),
    );
  }
}

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  late List<dynamic> _jobImage, _choreImage, _pendingImage;

  get curve => null;
  @override
  void initState() {
    super.initState();
    _pendingImage = [
      ['assets/chita.jpg', 'Pending Job 1'],
      ['assets/deer.jpg', 'Pending Job 2']
    ];
    _choreImage = [
      ['assets/bear.jpg', 'Job5'],
      ['assets/bear.jpg', 'Job6'],
      ['assets/bear.jpg', 'Job7'],
      ['assets/bear.jpg', 'Job8']
    ];
    _jobImage = [
      ['assets/duck.jpg', 'Job1'],
      ['assets/duck.jpg', 'Job2'],
      ['assets/duck.jpg', 'Job3'],
      ['assets/duck.jpg', 'Job4']
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PageView(
            controller: _pageController,
            children: [
              Column(
                //Começa a pagina 1 da page view, mostra os jobs
                children: [
                  _divider("Jobs"),
                  new Expanded(
                    child: new ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _jobImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.indigoAccent.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Container(
                                    margin: EdgeInsets.all(5),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage(_jobImage[index][0]),
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
                                                        ProfileViewOnly(
                                                            str:
                                                                _jobImage[index]
                                                                    [0])));
                                          },
                                        )),
                                  ),
                                  VerticalDivider(),
                                  Text(_jobImage[index][1]),
                                  VerticalDivider(),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 110,
                                        height: 30,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GMap(
                                                              str: _jobImage[
                                                                  index][0])));
                                            },
                                            child: Text("Details")),
                                      ),
                                      Divider(),
                                      SizedBox(
                                        width: 110,
                                        height: 30,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, "/Message");
                                            },
                                            child: Text("Message")),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  _divider("Pending"),
                  new Expanded(
                    child: new ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _pendingImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.indigoAccent.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Container(
                                    margin: EdgeInsets.all(5),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              _pendingImage[index][0]),
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
                                                        ProfileViewOnly(
                                                            str: _pendingImage[
                                                                index][0])));
                                          },
                                        )),
                                  ),
                                  VerticalDivider(),
                                  Text(_pendingImage[index][1]),
                                  VerticalDivider(),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      width: 110,
                                      height: 50,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => GMap(
                                                        str:
                                                            _pendingImage[index]
                                                                [0])));
                                          },
                                          child: Text("Details")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              //Acaba a primeira pagina e começa a segunda
              Column(
                children: [
                  _divider("Chores"),
                  new Expanded(
                    child: new ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _choreImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.orangeAccent.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Container(
                                    margin: EdgeInsets.all(5),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage(_choreImage[index][0]),
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
                                                        ProfileViewOnly(
                                                            str: _choreImage[
                                                                index][0])));
                                          },
                                        )),
                                  ),
                                  VerticalDivider(),
                                  Text(_choreImage[index][1]),
                                  VerticalDivider(),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      width: 110,
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "/Message");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.orange),
                                          child: Text("Message")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 2,
                  effect: WormEffect(),
                  onDotClicked: (index) => _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceOut),
                ),
              )
            ],
          ),
        ],
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
      Text(
        input,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
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
