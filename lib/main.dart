import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  late CalendarController _calendar;
  TextStyle dayStyle(FontWeight fontWeight){
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }
  TextStyle weekendStyle(FontWeight fontWeight){
    return TextStyle(color: Color(0xff4EE0D8), fontWeight: fontWeight);
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
                  CalendarFormat.month: 'month',
                  CalendarFormat.twoWeeks: '2 weeks',
                },
                  startingDayOfWeek: StartingDayOfWeek.monday,
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

                padding: EdgeInsets.only(left: 30,top: 30,right: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                  color: Color(0xffDCDCDC),
                  boxShadow: <BoxShadow>[BoxShadow(
                    color: Color(0xff5c5c5c),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                  )]
                ),
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return
                    Card(
                    margin: const EdgeInsets.all(0.0),

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(

                        children: <Widget>[
                          Text("ytuyvv"),
                          Text("jjggjgjhk")
                        ],
                      ),
                    ),
                  );
                },
                  itemCount: column_counter,

                ),
              ),
              /*Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),*/
            ],
          ),

        )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}


