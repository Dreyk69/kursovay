import 'package:flutter/material.dart';

import '../main_screen/main_screen_widget.dart';
import '../timing/timing_widget.dart';

class FinalBookingWidget extends StatelessWidget {
  static const routeName =
      '/calendar_widget/timing_widget/final_booking_widget';
  const FinalBookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argument;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пополнение счета'),
      ),
      body: Column(children: [
        Expanded(
            child: ColoredBox(
          color: Colors.white,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(Icons.location_on),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Выбранный центр'),
                        Text(argument.title),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Выбранное время'),
                        if (argument.packagesname == null) ...[
                          Text(
                              '${argument.data.toString().split(' ')[0]}, ${argument.timestart.hour.toString().padLeft(2, '0')}:${argument.timestart.minute.toString().padLeft(2, '0')} - ${argument.timefinish?.hour.toString().padLeft(2, '0')}:${argument.timefinish?.minute.toString().padLeft(2, '0')}')
                        ] else ...[
                          Text(
                              '${argument.data.toString().split(' ')[0]}, ${argument.timestart.hour.toString().padLeft(2, '0')}:${argument.timestart.minute.toString().padLeft(2, '0')} - ${argument.packagesname}')
                        ]
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(Icons.devices),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Выбранное место'),
                        Text(argument.placetypes),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Text('Сумма к оплате: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: const Text('  0 р. '),
            )
          ]),
        )),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(MainScreenWidget.routeName, (Route<dynamic> route) => false);
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(13)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: const Text('Оплатить',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        )
      ]),
    );
  }
}
