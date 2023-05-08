import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'dart:developer';


class PickerScreen extends StatelessWidget {
  const PickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.black,
        selectedTextColor: Colors.white,
        onDateChange: (date) {

          log('This is a log message : $date' );  // 일반 로그
          log('This is an error message', error: 'Error occurred');  // 에러 로그
          log('This is a warning message', level: 50);  // 경고 로그
          // do something with the selected date
        },
      ),
    );
  }
}
