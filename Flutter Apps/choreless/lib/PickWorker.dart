import 'package:choreless/profile.dart';
import 'package:flutter/material.dart';

class PickWorker extends StatefulWidget {
  String str;

  PickWorker({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  _PickWorkerState createState() => _PickWorkerState();
}

class _PickWorkerState extends State<PickWorker> {
  late Map<String, List<String>> _workers;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _workers = {
      'Cleaning car': ['assets/duck.jpg', 'assets/bear.jpg', 'assets/deer.jpg'],
      'Walking dog': [
        'assets/squirel.jpg',
        'assets/bear.jpg',
        'assets/chita.jpg',
        'assets/duck.jpg'
      ]
    };
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.str),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
            child: SizedBox(
                height: 600, // card height
                child: PageView.builder(
                    itemCount: _workers[widget.str]!.length,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                            color: Colors.orange.shade300,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileViewOnly(
                                                    str: _workers[widget.str]![
                                                        i])));
                                  },
                                  child: SizedBox(
                                    height: 400,
                                    child: Image.asset(_workers[widget.str]![i],
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      child: Text(
                                        '300',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      color: Colors.orange.shade300,
                                    ),
                                    Card(
                                      child: Text(
                                        'DOGE',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      color: Colors.orange.shade300,
                                    ),
                                    VerticalDivider(),
                                    Card(
                                      child: Text(
                                        '20/04/2021',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      color: Colors.orange.shade300,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 120,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.greenAccent.shade700,
                                          onPrimary: Colors.white,
                                          onSurface: Colors.grey,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Accept',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.green.shade900),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 150,
                                      width: 120,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.redAccent,
                                          onPrimary: Colors.white,
                                          onSurface: Colors.grey,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Refuse',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.red.shade900),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      );
                    }))));
  }
}
