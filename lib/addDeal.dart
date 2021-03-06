import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_range/time_range.dart';
import 'package:path_provider/path_provider.dart';

import 'model/deal.dart';

class addDeal extends StatefulWidget {
  addDeal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _addDealState createState() => _addDealState();
}


class _addDealState extends State<addDeal> {

  DateTime dealDate = DateTime.now();
  String dealName = "11";
  String dealDescription = "22";


  File? jsonFile=null;
  Directory? dir=null;
  String fileName = "myJsonForDeals3.json";
  bool fileExist = false;
  //Map<Deal>? fileContent=null;
  List<dynamic>? fileContent=[];

  @override
  void initState(){
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory){
      dir = directory;
      jsonFile = new File(dir!.path+"/"+fileName);
      fileExist = jsonFile!.existsSync();
      if(fileExist) this.setState(() => fileContent = json.decode(jsonFile!.readAsStringSync()));
    });
  }


  void createFile(List<dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExist = true;
    file.writeAsStringSync(json.encode(content));
  }


  void writeToFile(Deal deal){
    print("write to filr");
    Deal content =deal;
    List<dynamic> newContent = fileContent!;

    Map<String, dynamic> content1 =deal.toJson();

    newContent.add(content1);
    if(fileExist){
      print("file is");

      List<dynamic> jsonFileContent = json.decode(jsonFile!.readAsStringSync());
      jsonFileContent.addAll([content]);
      jsonFile!.writeAsStringSync(json.encode(jsonFileContent));

    } else{
      print("no file");
      createFile(newContent, dir!, fileName);
    }
    print("DDDDD "+newContent.toString());
    this.setState(() => fileContent =  json.decode(jsonFile!.readAsStringSync()));
  }


  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;



  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 1.2,
          color: Colors.black45
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(7.0) //                 <--- border radius here
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('???????????????????? ????????'),
            backgroundColor: Color(0xff3AF0E5)
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20,top: 10,right: 20),
          color: Color(0xfff5f5f5),
          child:
          SingleChildScrollView(

            child: Column(

              children: [
                /*Text(fileContent.toString()),*/
                SizedBox(height: 7,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: (
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                              color: Colors.black54,


                            ),
                            text: "???????"
                        ),
                      )

                  ),
                )
                ,
                Container(

                  color: Colors.white,
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "?????? ?????????? ????????????",
                      border: OutlineInputBorder(),

                      fillColor: Color(0xff3AF0E5),
                      focusColor: Color(0xff3AF0E5),
                      hoverColor: Color(0xff3AF0E5),
                      suffixIcon: Icon(Icons.event_note),
                    ),
                    onSubmitted: (text) {
                      dealName = text;
                    },
                    onChanged: (text) {
                      dealName = text;
                    },
                    keyboardType: TextInputType.text,
                  ),

                )
                ,
                SizedBox(height: 14,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: (
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                              color: Colors.black54,

                            ),
                            text: "???????????"
                        ),
                      )
                  ),
                ),

                Container(
                  height: 100,
                  decoration: myBoxDecoration(),
                  child: CupertinoDatePicker(
                    //backgroundColor: Colors.white,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newDateTime) {
                      dealDate = newDateTime;
                    },
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  decoration: myBoxDecoration(),
                  child: Column(
                    children: [

                      SizedBox(height: 10,),

                      TimeRange(
                        fromTitle: Text(
                          'FROM',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        toTitle: Text(
                          'TO',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        titlePadding: 20,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                        activeTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        borderColor: Colors.black54,
                        activeBorderColor: Colors.black54,
                        backgroundColor: Color(0xff3AF0E5),
                        activeBackgroundColor: Colors.black54,
                        firstTime: TimeOfDay(hour: 0, minute: 00),
                        lastTime: TimeOfDay(hour: 23, minute: 59),
                        initialRange: _timeRange,
                        timeStep: 10,
                        timeBlock: 10,
                        onRangeCompleted: (range) => setState(() => _timeRange = range),
                      ),
                    SizedBox(height: 30),
                          if (_timeRange != null)
                            Padding(
                            padding: const EdgeInsets.only(top: 0.0, left: 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                      Text(
                                        'Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                                        style: TextStyle(fontSize: 15, color: Colors.black54),
                                      ),

                                ],
                            ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 14,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: (
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                              color: Colors.black54,



                            ),
                            text: "??????? ???????????"
                        ),
                      )
                  ),
                ),
                SingleChildScrollView(
                  child: Container(

                      color: Colors.white,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 5,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(

                          hintText: "??????????????????, ????????????????",
                          border: OutlineInputBorder(),

                        ),
                        onSubmitted: (text) {
                          dealDescription = text;
                        },
                        onChanged: (text) {
                          dealDescription = text;
                        },

                      )

                  ),
                )

                ,
                SizedBox(height: 30,),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 350, height: 50),
                    child: ElevatedButton(

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff3AF0E5)),

                      ),

                      child: Text('????????????????'),

                      onPressed: () {
                        writeToFile( Deal(id: 1, color: "fff", time_start: _timeRange!.start.inMinutes(), date: dealDate.millisecondsSinceEpoch, time_finish: _timeRange!.end.inMinutes(), name: dealName, description: dealDescription ));
                        Navigator.pop(context);
                      },
                    ),
                  ),

                ),

              ],
            ),
          ),
        )
    );
  }

}

