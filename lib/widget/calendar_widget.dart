import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  
  var selectedDate;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(8.0),
      child: AnimatedHorizontalCalendar(
          tableCalenderIcon: const Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          date: DateTime.now(),
          textColor: Colors.black45,
          backgroundColor: Colors.white,
          tableCalenderThemeData: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.light(primary: Colors.green)
                .copyWith(secondary: Colors.red),
          ),
          selectedColor: Colors.redAccent,
          onDateSelected: (date) {
            selectedDate = date;
          }),
    );
  }
}
