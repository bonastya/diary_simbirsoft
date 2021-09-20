import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import 'addDeal.dart';
import 'model/deal.dart';
import 'model/deal.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  int column_counter =4;
  int hour_heigh = 60;
  var selectedDate=DateTime.now();
  //var deals = [Deal( time_start: 60, color: "Colors.amber", id: 1, name: 'name1', description: 'description', time_finish: 120 ),Deal( time_start: 120, color: "Colors.amber", id: 1, name: 'name2', description: 'description', time_finish: 180 ),Deal( time_start: 380, color: "Colors.amber", id: 1, name: 'name', description: 'description', time_finish: 570 ),Deal( time_start: 1000, color: "Colors.amber", id: 1, name: 'name', description: 'description', time_finish: 1200 )];
  //var deals = getDeals();

  late CalendarController _calendar;


  TextStyle dayStyle(FontWeight fontWeight){
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }
  TextStyle weekendStyle(FontWeight fontWeight){
    return TextStyle(color: Color(0xff4EE0D8), fontWeight: fontWeight);
  }

  Future<List<Deal>> getDeals() async {
    final responce =await rootBundle.loadString("lib/assets/deals.json");
    final data = await json.decode(responce) as List<dynamic>;
/*
    var dealsList =  new List<Deal>.from(
        jsonList.map((json) => new Deal.fromJson(json)).toList()
    );*/


    return data
        .map((e) => Deal.fromJson(e))
        .toList()
        .where((e) => (dealInSelectedDay(e)))
        .toList();

  }

  bool dealInSelectedDay(Deal d) {
    DateTime deal = DateTime.fromMillisecondsSinceEpoch(d.date);

    /*print("TTTTTTT"+selectedDate.day.toString());
    print("TTTTTTT33 "+selectedDate.millisecondsSinceEpoch.toString());
    print("TTTTTTT33 "+DateTime.fromMillisecondsSinceEpoch(selectedDate.millisecondsSinceEpoch).day.toString());
    print("TTTTTTT"+deal.toString());*/
    //print("TTTTTTT33 "+selectedDate.millisecondsSinceEpoch.toString());
    if (deal.year == selectedDate.year &&
        deal.month == selectedDate.month &&
        deal.day == selectedDate.day
    ) return true;
    return false;
  }



  @override
  void initState(){
    super.initState();
    _calendar=CalendarController();
  }
  @override
  void dispose(){
    super.dispose();
    //_calendar.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("MyDairy"),
        backgroundColor: Color(0xff3AF0E5)
        //backgroundColor: Color(0xFFFF1744)
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
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
                          for(Deal d in deals)
                          Expanded(
                            child: Column(
                            children: [
                            Container(
                            color: Colors.white,
                            height: hour_heigh/60*d.time_start,
                            width: 200,

                            ),
                            Container(
                            color: Color(0xffd1fff6),
                            height: hour_heigh/60*(d.time_finish-d.time_start),
                            width: 200,
                            child: Text(d.name),
                            ),
                            Container(
                            color: Colors.white,
                            height: hour_heigh/60*(24*60-d.time_finish),
                            width: 200,
                            )
                            /*for(int j=0;j<24;j++)
                                    Container(
                                      color: Colors.white,
                                      height: hour_heigh*1,
                                      width: 200,
                                      child: Text("ytuyvv"),
                                    )*/
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





