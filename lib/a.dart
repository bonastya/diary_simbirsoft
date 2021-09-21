/*
import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, left: leftPadding),
                child: Text(
                  'Opening Times',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold, color: dark),
                ),
              ),
              SizedBox(height: 20),
              TimeRange(
                fromTitle: Text(
                  'FROM',
                  style: TextStyle(
                    fontSize: 14,
                    color: dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                toTitle: Text(
                  'TO',
                  style: TextStyle(
                    fontSize: 14,
                    color: dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                titlePadding: leftPadding,
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: dark,
                ),
                activeTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: orange,
                ),
                borderColor: dark,
                activeBorderColor: dark,
                backgroundColor: Colors.transparent,
                activeBackgroundColor: dark,
                firstTime: TimeOfDay(hour: 8, minute: 00),
                lastTime: TimeOfDay(hour: 20, minute: 00),
                initialRange: _timeRange,
                timeStep: 10,
                timeBlock: 30,
                onRangeCompleted: (range) => setState(() => _timeRange = range),
              ),
              SizedBox(height: 30),
              if (_timeRange != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: leftPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                        style: TextStyle(fontSize: 20, color: dark),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        child: Text('Default'),
                        onPressed: () =>
                            setState(() => _timeRange = _defaultTimeRange),
                        color: orange,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ));
  }
}










void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {

  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "myFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value) {
    print("Writing to file!");
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("JSON Tutorial"),),
      body: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("File content: ", style: new TextStyle(fontWeight: FontWeight.bold),),
          new Text(fileContent.toString()),
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("Add to JSON file: "),
          new TextField(
            controller: keyInputController,
          ),
          new TextField(
            controller: valueInputController,
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new RaisedButton(
            child: new Text("Add key, value pair"),
            onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
    );
  }
}*/
