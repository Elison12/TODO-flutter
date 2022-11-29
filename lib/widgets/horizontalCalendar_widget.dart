import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

Padding calendarWidget() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: FlutterDatePickerTimeline(
      itemHeight: 40,
      selectedItemBackgroundColor: Color(0xFF939fdb),
      startDate: DateTime(2022, 11, 25),
      endDate: DateTime(2022, 12, 15),
      initialSelectedDate: DateTime.now(),
      onSelectedDateChange: (DateTime? dateTime) {
        print(dateTime);
      },
    ),
  );
}
