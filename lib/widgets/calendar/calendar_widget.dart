import 'package:flutter/material.dart';
import 'package:kursovay/widgets/booking/booking_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
   static const routeName = '/main_screen/calendar_widget';
  DateTime today = DateTime.now();
  CalendarWidget(
      {super.key,});

  @override
  Widget build(BuildContext context) {
  final arguments = ModalRoute.of(context)!.settings.arguments as AddressesListClass;
  final id = arguments;
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
                    Text('Тут должен быть текст из аргумента',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text('Тут должен быть текст из аргумента',
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
