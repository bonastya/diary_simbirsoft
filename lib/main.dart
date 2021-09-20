import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'addDeal.dart';
import 'model/deal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {


  int tick = 0;

  Directory? dir = null;
  File? jsonFile = null;
  List<dynamic>? fileContent = [];
  List<dynamic> jsonFileContent = [];

  String fileName = "myJsonForDeals3.json";
  bool fileExist = false;



  int _counter = 0;
  int column_counter =4;
  int hour_heigh = 60;
  var selectedDate=DateTime.now();
  late CalendarController _calendar;


  TextStyle dayStyle(FontWeight fontWeight){
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }
  TextStyle weekendStyle(FontWeight fontWeight){
    return TextStyle(color: Color(0xff4EE0D8), fontWeight: fontWeight);
  }


  @override
  void initState() {
    super.initState();
    _calendar=CalendarController();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir!.path + '/' + fileName);
      fileExist = jsonFile!.existsSync();

      if (!fileExist) createFile([], dir!, fileName);

      this.setState(() {
        fileContent = json.decode(jsonFile!.readAsStringSync());
      });
    });
  }

  void createFile(List<dynamic> content, Directory dir, String fileName) {
    File file = new File(dir.path + '/' + fileName);
    file.createSync();
    fileExist = true;
    file.writeAsStringSync(json.encode(content));
  }

  Future<List<Deal>> getDeals() async {
    jsonFileContent = await json.decode(jsonFile!.readAsStringSync());

    List<Deal> newList = [];

    for (dynamic item in jsonFileContent) {
      Deal newDeal = new Deal(
          id: item['id'],
          color: item['color'],
          time_start: item['time_start'],
          time_finish: item['time_finish'],
          date: item['date'],
          name: item['name'],
          description: item["description"]);
      newList.add(newDeal);
    }

    tick++;
    if (tick >= 10) {
      setState(() {});
      tick = 0;
      print("EEEEEEEEEE");
    }
    return newList.where((e) => (dealInSelectedDay(e))).toList();
  }



  bool dealInSelectedDay(Deal d) {
    DateTime deal = DateTime.fromMillisecondsSinceEpoch(d.date);
    if (deal.year == selectedDate.year &&
        deal.month == selectedDate.month &&
        deal.day == selectedDate.day
    ) return true;
    return false;
  }


  @override
  void dispose(){
    super.dispose();
    //_calendar.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

          title: Text("MyDairy"),
          backgroundColor: Color(0xff3AF0E5)
      ),
      body: Container(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TableCalendar(
                    initialCalendarFormat: CalendarFormat.twoWeeks,

                    availableCalendarFormats: const {
                      CalendarFormat.month: 'месяц',
                      CalendarFormat.twoWeeks: '2 недели',
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: (DateTime date,events, _) {
                      this.setState(() => selectedDate = date);
                    },

                    calendarStyle:CalendarStyle(
                        weekdayStyle: dayStyle(FontWeight.normal),
                        weekendStyle: weekendStyle(FontWeight.normal),
                        selectedColor: Color(0xff3AF0E5),
                        todayColor: Color(0xff96F9F3)

                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            color: Color(0xff30384c),
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                        weekendStyle: TextStyle(
                            color: Color(0xff4EE0D8),
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        )
                    ),
                    headerStyle: HeaderStyle(
                      //formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            color: Color(0xff30384c),
                            fontWeight: FontWeight.normal,
                            fontSize: 19
                        )
                    ),

                    calendarController: _calendar
                ),
                SizedBox(height: 20,),
                Container(

                  padding: EdgeInsets.only(left: 20,top: 30,right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: hour_heigh*24+40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                      color: Color(0xffDCDCDC),
                      boxShadow: <BoxShadow>[BoxShadow(
                        color: Color(0xff5c5c5c),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                      )]
                  ),
                  child:    FutureBuilder<List<Deal>>(
                      future: getDeals(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Center(child: Text('${data.error}'));
                        }
                        else if(data.hasData){
                          var deals = data.data as List<Deal>;
                          return  Row(
                            children: [
                              Column(
                                  children: [
                                    for(int j=0;j<24;j++)
                                      Container(
                                        color: Color(0xff3AF0E5),
                                        height: hour_heigh*1,
                                        width: 40,
                                        margin: EdgeInsets.only(right: 2),
                                        child: Text(intToTime(j)),
                                      )
                                  ]
                              ),
                              if(deals.length==0)
                                Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          width: 2000,
                                          height: hour_heigh*24,
                                        )
                                      ],
                                    )
                                ),
                              for(Deal d in deals)
                                Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: hour_heigh/60*d.time_start,
                                          width: 2000,

                                        ),
                                        Container(
                                          color: Color(0xffd1fff6),
                                          height: hour_heigh/60*(d.time_finish-d.time_start),
                                          width: 2000,
                                          child: Text(d.name),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: hour_heigh/60*(24*60-d.time_finish),
                                          width: 2000,
                                        )

                                      ],
                                    ))
                            ],
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }
                  ),

                ),
              ],
            ),

          )

      ),
      floatingActionButton: FloatingActionButton(
        /*onPressed: _incrementCounter,*/
        backgroundColor: Color(0xff3AF0E5),
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {
          //Нажатие на плавающую кнопку (справа сверху)
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>addDeal(title: '555',)));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String intToTime(int j) {
    if(j<10)
      return "0"+j.toString()+":00";
    else
      return j.toString()+":00";

  }


}





