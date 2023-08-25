import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../booking/booking_widget.dart';

class CalendarWidget extends StatelessWidget {
  DateTime today = DateTime.now();
  final int addressesId;
  final String addressesTitle;
  final String addressesAddress;
  CalendarWidget(
      {super.key,
      required this.addressesId,
      required this.addressesTitle,
      required this.addressesAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбрать дату'),
      ),
      body: ColoredBox(
        color: Colors.white,
        child: Column(children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: const Color.fromARGB(255, 40, 40, 40),
            elevation: 20,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressesTitle,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(addressesAddress,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 208, 208, 208),
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
//          TableCalendar(
//              focusedDay: today,
//             firstDay: DateTime.utc(2010, 10, 16),
//             lastDay: DateTime.utc(2030, 3, 14))
        ]),
      ),
    );
  }
}
