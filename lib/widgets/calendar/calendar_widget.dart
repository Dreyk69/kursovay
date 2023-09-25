import 'package:flutter/material.dart';
import 'package:kursovay/widgets/booking/booking_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../timing/timing_widget.dart';

class Argumentik {
  final String title;
  final String address;
  late final DateTime data;

  Argumentik(this.title, this.address, this.data);
}

class CalendarWidget extends StatefulWidget {
  static const routeName = '/main_screen/calendar_widget';
  const CalendarWidget({
    super.key,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Addresses;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбрать дату'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: const Color.fromARGB(255, 40, 40, 40),
          elevation: 20,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(argument.title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(argument.address,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 208, 208, 208),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
        TableCalendar(
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          focusedDay: today,
          firstDay: DateTime(2017),
          lastDay: DateTime(2137),
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: _onDaySelected,
          onDayLongPressed: (selectedDay, focusedDay) {
            Navigator.of(context).pushNamed(
              TimingWidget.routeName,
              arguments: Argumentik(argument.title, argument.address, focusedDay),
            );
          },
        )
      ]),
    );
  }
}
