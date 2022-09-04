// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:group2/Classes/service_provider_methods.dart';
import 'package:group2/common/size.dart';

import '../globals.dart';

class pickdate extends StatefulWidget {
  pickdate({Key? key}) : super(key: key);

  @override
  State<pickdate> createState() => _pickdateState();
}

class _pickdateState extends State<pickdate> {
  DateTime dateTime = DateTime(2022, 01, 01, 00, 00);
  late String app_date;
  late String app_date_str;
  late String app_time_str;

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Text(
                  "Pick a Date",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.15),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                //two blue buttons date and time
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: Text(
                        '${dateTime.year}-${dateTime.month}-${dateTime.day} '
                        ,
                        style: TextStyle(
                          fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            height: 2
                        ),),
                    onPressed: () async {
                      final date = await pickDate();
                      if (date == null) return; //pressed 'Cancel'

                      final newDateTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        dateTime.hour,
                        dateTime.minute,
                      );

                      setState(() {
                        dateTime = newDateTime;
                        app_date=dateTime.toString();
                        app_date_str= app_date.substring(0,10);
                      }); //pressed 'OK'
                    },
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                      child: ElevatedButton(
                    child: Text('$hours:$minutes'
                     ,
                        style: TextStyle(
                          fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            height: 2
                        ),),
                    onPressed: () async {
                      final time = await pickTime();
                       if (time == null) return; //pressed 'Cancel'

                       final newDateTime = DateTime(
                        dateTime.year,
                        dateTime.month,
                        dateTime.day,
                        time.hour,
                        time.minute,

                        
                       );
                       setState(() {
                         dateTime = newDateTime;
                         app_date=dateTime.toString();

                         app_time_str=app_date.substring(11,16);
                       });
                    },
                  ))
                ],
              ),
              SizedBox(height: 50.0,),
              ElevatedButton(
                onPressed: () async {
                  print(dateTime);
                  print(app_date);
                  print(app_date_str);
                  print(app_time_str);
                  await SPMethods().addAppointment(consumer['_id'], sp['email'], app_date_str, app_time_str).then((val){
                    if(val.data['success']){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Appointment Made Successfully'),
                          content: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 60,
                          ),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
                                },
                                child: Text('OK'),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  });
                },
                child: Text(
                  'Make Appointment',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF189AB4),
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100));
      
     
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
     );
}
