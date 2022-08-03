// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';

class pickdate extends StatefulWidget {
  pickdate({Key? key}) : super(key: key);

  @override
  State<pickdate> createState() => _pickdateState();
}

class _pickdateState extends State<pickdate> {
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                        '${dateTime.year}/${dateTime.month}/${dateTime.day} '
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

                      setState(() => dateTime = newDateTime); //pressed 'OK'
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
                       setState(() => dateTime = newDateTime);
                    },
                  ))
                ],
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
