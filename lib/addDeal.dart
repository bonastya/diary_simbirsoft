import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class addDeal extends StatelessWidget {
  const addDeal({Key? key}) : super(key: key);


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 1.2,
        color: Colors.black45
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(10.0) //                 <--- border radius here
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
                ),

              )
              ,
              SizedBox(height: 20,),
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
                decoration: myBoxDecoration(),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newDateTime) {
                          // Do something
                        },
                      ),
                    ),
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
                    Row(
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
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
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