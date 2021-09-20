import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_range/time_range.dart';

class addDeal extends StatefulWidget {
  addDeal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _addDealState createState() => _addDealState();
}


class _addDealState extends State<addDeal> {

  DateTime dealDate = DateTime.now();
  /*TimeRange timeRange = TimeRange(
      firstTime: TimeOfDay(hour: 8, minute: 0),
      lastTime: TimeOfDay(hour: 21, minute: 0), timeBlock: 5, onRangeCompleted: (TimeRangeResult? range) {  },);
  */
  String dealName = "11";
  String dealDescription = "22";

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
            title: Text('Добавление дела'),
            backgroundColor: Color(0xff3AF0E5)
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20,top: 10,right: 20),
          color: Color(0xfff5f5f5),
          child:
          SingleChildScrollView(

            child: Column(

              children: [
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
                            text: "Что?"
                        ),
                      )

                  ),
                )
                ,
                Container(

                  color: Colors.white,
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "что будем делать",
                      border: OutlineInputBorder(),

                      fillColor: Color(0xff3AF0E5),
                      focusColor: Color(0xff3AF0E5),
                      hoverColor: Color(0xff3AF0E5),
                      suffixIcon: Icon(Icons.event_note),
                      //helperText: "Логин используется для входа в систему"
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
                            text: "Когда?"
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
                      /*InputDatePickerFormField(firstDate: DateTime.now(), lastDate: DateTime.now(),),*/
                      /*DatePickerDialog(initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate: DateTime.now()),
              */
                      /*Align(
                alignment: Alignment.centerLeft,
                child: (
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                            color: Colors.black54,



                          ),
                          text: "Время"
                      ),
                    )
                ),
              ),*/
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
                                      /*SizedBox(height: 20),
                                      MaterialButton(
                                        child: Text('Default'),
                                        onPressed: () =>
                                            setState(() => _timeRange = _defaultTimeRange),
                                        color: Color(0xff3AF0E5),
                                      )*/
                                ],
                            ),
                      ),


                     /* Row(
                        children: [
                          Expanded(
                              child:
                              Column(
                                children: [
                                  Text("Начало"),
                                  Container(
                                    height: 100,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,

                                      mode: CupertinoDatePickerMode.time,
                                      initialDateTime: DateTime(1969, 1, 1),
                                      onDateTimeChanged: (DateTime newDateTime) {
                                        // Do something
                                      },
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(width: 17,),
                          Expanded(
                              child:
                              Column(
                                children: [
                                  Text("Конец"),
                                  Container(
                                    height: 100,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      mode: CupertinoDatePickerMode.time,
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (DateTime newDateTime) {
                                        // Do something
                                      },
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),*/
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
                            text: "Как? Зачем?"
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

                          hintText: "пояснение, описание",
                          border: OutlineInputBorder(),

                          /*prefixIconConstraints: BoxConstraints(
                      maxHeight: 32,
                      minWidth: 32,

                    ),*/

                          //helperText: "Логин используется для входа в систему"
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

                      child: Text('Добавить'),

                      onPressed: () {
                        print("TTTTTT "+dealName+" "+dealDescription+" "+dealDate.toString()+" "+_timeRange!.start.toString()+" "+_timeRange!.end.toString());

                        // Navigate to second route when tapped.
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

