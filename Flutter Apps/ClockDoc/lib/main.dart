import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

String dataRecieved = '0km&0%';
void main() {
  runApp(clockDoc());
}

class clockDoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClockDoc',
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData.dark(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _random = new Random();
  String dropdownValue = 'No Answer';
  final String SERVICE_UUID = "9a48ecba-2e92-082f-c079-9e75aae428b1";
  final String CHARACTERISTIC_UUID = "2d2f88c4-f244-5a80-21f1-ee0224e80658";
  final String TARGET_DEVICE_NAME = "Nano33BLESENSE";

  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription<ScanResult> scanSubscription;

  BluetoothDevice targetDevice;
  BluetoothCharacteristic targetCharacteristic;

  String connectionText = "";

  @override
  void initState() {
    super.initState();
    startScan();
  }

  startScan() {
    setState(() {
      connectionText = "Start Scanning";
    });

    scanSubscription = flutterBlue.scan().listen((scanResult) {
      print(scanResult.device.name);
      if (scanResult.device.name == (TARGET_DEVICE_NAME)) {
        stopScan();

        setState(() {
          connectionText = "Found Target Device";
        });

        targetDevice = scanResult.device;
        connectToDevice();
      }
    }, onDone: () => stopScan());
  }

  stopScan() {
    scanSubscription?.cancel();
    scanSubscription = null;
  }

  connectToDevice() async {
    if (targetDevice == null) {
      return;
    }

    setState(() {
      connectionText = "Device Connecting";
    });

    await targetDevice.connect();

    setState(() {
      connectionText = "Device Connected";
    });

    discoverServices();
  }

  disconnectFromDeivce() {
    if (targetDevice == null) return;

    targetDevice.disconnect();

    setState(() {
      connectionText = "Device Disconnected";
    });
  }

  discoverServices() async {
    if (targetDevice == null) {
      return;
    }

    List<BluetoothService> services = await targetDevice.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristics) {
          if (characteristics.uuid.toString() == CHARACTERISTIC_UUID) {
            targetCharacteristic = characteristics;
            setState(() {
              connectionText = "All Ready with ${targetDevice.name}";
            });
          }
        });
      }
    });
  }

  readData() async {
    if (targetCharacteristic == null) return null;
    Future.delayed(const Duration(milliseconds: 500), () async {
      dataRecieved = String.fromCharCodes(await targetCharacteristic.read());
      print("The recieved Characteristic Value $dataRecieved");
    });
  }

  writeData(String data) async {
    if (targetCharacteristic == null) return;

    List<int> bytes = utf8.encode(data);
    await targetCharacteristic.write(bytes);
  }

  @override
  void dispose() {
    super.dispose();
    stopScan();
  }

  submitAction() {
    var wifiData =
        '${bleNameController.text},${bleAgeController.text},${bleHeightController.text},${bleWeightController.text},${dropdownValue}';
    writeData(wifiData);
  }

  int random(min, max) => min + _random.nextInt(max - min);

  TextEditingController bleNameController = TextEditingController();
  TextEditingController bleAgeController = TextEditingController();
  TextEditingController bleHeightController = TextEditingController();
  TextEditingController bleWeightController = TextEditingController();
  TextEditingController bleGenderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ClockDoc APP'),
        ),
        body: Container(
          child: targetCharacteristic == null
              ? Center(
                  child: Text(
                    "Waiting...",
                    style: TextStyle(fontSize: 34, color: Colors.yellow),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: bleNameController,
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: bleAgeController,
                        decoration: InputDecoration(labelText: 'Age'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: bleHeightController,
                        decoration: InputDecoration(labelText: 'Height'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: bleWeightController,
                        decoration: InputDecoration(labelText: 'Weight'),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          style: const TextStyle(color: Colors.grey),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['No Answer', 'Male', 'Female']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: RaisedButton(
                        onPressed: submitAction,
                        color: Colors.indigoAccent,
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                )),
        ),
        floatingActionButton: targetCharacteristic != null ? _getFAB() : null);
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Colors.grey[700],
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.remove_red_eye_outlined),
            backgroundColor: Colors.indigoAccent,
            onTap: () {
              int value = random(0, 3);
              writeData(value.toString());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EyeTest(data: value)));
            },
            label: 'Eye Test',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.indigoAccent),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.directions_run_rounded),
            backgroundColor: Colors.indigoAccent,
            onTap: () {
              writeData('A');

              readData();

              print(dataRecieved);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CheckFitness(fitdata: dataRecieved)));
            },
            label: 'Check Status',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.indigoAccent)
      ],
    );
  }
}

class EyeTest extends StatefulWidget {
  final int data;

  EyeTest({Key key, @required this.data}) : super(key: key);

  @override
  _EyeTestState createState() => _EyeTestState();
}

class _EyeTestState extends State<EyeTest> {
  List<String> _tests;
  final List<Color> colors = <Color>[
    Colors.green,
    Colors.orange,
    Colors.deepPurple
  ];
  @override
  void initState() {
    super.initState();
    _tests = ['assets/test1.jpg', 'assets/test2.jpg', 'assets/test3.jpg'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              child: Image.asset(_tests[widget.data]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 5.0, color: Colors.white),
                    color: colors[widget.data]),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CheckFitness extends StatefulWidget {
  final String fitdata;

  CheckFitness({Key key, @required this.fitdata}) : super(key: key);

  @override
  _CheckFitnessState createState() => _CheckFitnessState();
}

class _CheckFitnessState extends State<CheckFitness> {
  @override
  Widget build(BuildContext context) {
    var dataSplit = widget.fitdata.split('&');
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Walked: ' + dataSplit[0],
            style: TextStyle(fontSize: 34, color: Colors.yellow),
          ),
          Divider(
            thickness: 2,
          ),
          Text(
            'Test Accurary: ' + dataSplit[1],
            style: TextStyle(fontSize: 34, color: Colors.yellow),
          )
        ],
      ),
    );
  }
}
