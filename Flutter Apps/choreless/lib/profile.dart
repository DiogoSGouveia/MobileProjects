import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileUi extends StatefulWidget {
  String str;

  ProfileUi({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  _ProfileUiState createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  late List<dynamic> _drawerTiles;

  @override
  void initState() {
    super.initState();
    _drawerTiles = [
      ["Settings", '57519'],
      ['Payment Preferences', '58074'],
      ['Help', '62032'],
      ['Log Out', '62404']
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            toolbarHeight: 125,
            title: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded, // add custom icons also
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  //alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.str), fit: BoxFit.cover),
                  ),
                )
              ],
            )),
        endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.indigoAccent,
          ),
          child: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                    ),
                    accountName: Text('Zé'),
                    accountEmail: Text('Ze@gmail.com')),
                new Expanded(
                    child: new ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _drawerTiles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new ListTile(
                              tileColor: Colors.indigoAccent,
                              hoverColor: Colors.orangeAccent,
                              title: Text(_drawerTiles[index][0]),
                              leading: Icon(IconData(
                                  int.parse(_drawerTiles[index][1]),
                                  fontFamily: 'MaterialIcons')),
                              onTap: () {});
                        }))
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 50, 25),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 50, 25),
              child: Text(
                'Description',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 50, 25),
              child: Text(
                'Recent reviews',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
    //crossAxisAlignment: CrossAxisAlignment.center,
  }
}

class ProfileViewOnly extends StatefulWidget {
  String str;

  ProfileViewOnly({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  _ProfileViewOnlyState createState() => _ProfileViewOnlyState();
}

class _ProfileViewOnlyState extends State<ProfileViewOnly> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            toolbarHeight: 125,
            title: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded, // add custom icons also
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  //alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.str), fit: BoxFit.cover),
                  ),
                )
              ],
            )),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 50, 25),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 50, 25),
              child: Text(
                'Description',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 50, 25),
              child: Text(
                'Recent reviews',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          elevation: 5,
          child: Icon(
            Icons.warning_amber_outlined,
          ),
        ),
      ),
    );
  }
}
