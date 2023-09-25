import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../calendar/calendar_widget.dart';
import '../final_booking/final_booking_widget.dart';

class Argument {
  final String title;
  late final DateTime data;
  final TimeOfDay timestart;
  final TimeOfDay? timefinish;
  final String placetypes;
  final String? packagesname;

  Argument(
      {required this.title,
      required this.data,
      required this.timestart,
      required this.placetypes,
      this.packagesname,
      this.timefinish,});
}

class TimingWidget extends StatefulWidget {
  static const routeName = '/calendar_widget/timing_widget';

  const TimingWidget({super.key});

  @override
  State<TimingWidget> createState() => _TimingWidgetState();
}

class _TimingWidgetState extends State<TimingWidget> {
  int selectedValue = 0;
  static final List<Widget> bodyWidget = <Widget>[
    const PerMinutePayment(),
    const TimePackages(),
  ];

  Map<int, Widget> children = <int, Widget>{
    0: const Text("Поминутная оплата"),
    1: const Text("Пакеты времени")
  };

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argumentik;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбрать время'),
      ),
      body: Column(children: [
        SizedBox(
          width: double.infinity,
          child: CupertinoSlidingSegmentedControl(
            children: children,
            onValueChanged: (value) {
              selectedValue = value!;
              setState(() {});
            },
            groupValue: selectedValue,
            thumbColor: Colors.blue,
            backgroundColor: CupertinoColors.black,
          ),
        ),
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
              Text(argument.data.toString().split(' ')[0],
                  style: const TextStyle(
                      color: Color.fromARGB(255, 208, 208, 208),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
        bodyWidget[selectedValue]
      ]),
    );
  }
}

enum SingingCharacter { standart, vipstandart }

class PerMinutePayment extends StatefulWidget {
  const PerMinutePayment({super.key});

  @override
  State<PerMinutePayment> createState() => _PerMinutePaymentState();
}

class _PerMinutePaymentState extends State<PerMinutePayment> {
  TimeOfDay timestart = const TimeOfDay(hour: 10, minute: 30);
  TimeOfDay timefinish = const TimeOfDay(hour: 10, minute: 30);
  SingingCharacter? _character = SingingCharacter.standart;
  var placetype = 'Стандартное место';

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argumentik;
    final hoursstart = timestart.hour.toString().padLeft(2, '0');
    final minutesstart = timestart.minute.toString().padLeft(2, '0');
    final hoursfinish = timefinish.hour.toString().padLeft(2, '0');
    final minutesfinish = timefinish.minute.toString().padLeft(2, '0');
    return Column(
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text(
            'Выберите время на которое вы хотите забронировать место, каждые 10 минут будут оцениваться в 50р',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 30),
            Column(
              children: [
                Text(
                  '$hoursstart:$minutesstart',
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTimestart = await showTimePicker(
                        context: context,
                        initialTime: timestart,
                      );

                      if (newTimestart == null) return;

                      setState(() => timestart = newTimestart);
                    },
                    child: const Text(
                      'Выбрать время начала',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 40),
            Column(
              children: [
                Text(
                  '$hoursfinish:$minutesfinish',
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTimefinish = await showTimePicker(
                        context: context,
                        initialTime: timefinish,
                      );

                      if (newTimefinish == null) return;

                      setState(() => timefinish = newTimefinish);
                    },
                    child: const Text(
                      'Выбрать время конца',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text('Стандартное место(50р/ч)'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.standart,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                placetype = 'Стандартное место';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('VIP место(75р/ч)'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.vipstandart,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                placetype = 'VIP место';
              });
            },
          ),
        ),
        const SizedBox(height: 210),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                FinalBookingWidget.routeName,
                arguments: Argument(
                    title: argument.title,
                    data: argument.data,
                    timestart: timestart,
                    placetypes: placetype,
                    timefinish: timefinish),
              );
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
            child: const Text('Далее',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}

class TimePackages extends StatefulWidget {
  const TimePackages({super.key});

  @override
  State<TimePackages> createState() => _TimePackagesState();
}

class _TimePackagesState extends State<TimePackages> {
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
  SingingCharacter? _character = SingingCharacter.standart;
  String placetype = 'Стандартное место';

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argumentik;
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text('Выберите время начала бронирования:'),
        const SizedBox(height: 5),
        Text(
          '$hours:$minutes',
          style: const TextStyle(fontSize: 32),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: time,
              );

              if (newTime == null) return;

              setState(() => time = newTime);
            },
            child: const Text(
              'Выбрать время начала',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text('Доступные пакеты:'),
        const SizedBox(height: 15),
        Row(
          children: [
            const SizedBox(width: 40),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        FinalBookingWidget.routeName,
                        arguments: Argument(
                            title: argument.title,
                            data: argument.data,
                            timestart: time,
                            placetypes: placetype,
                            packagesname: 'Пакет на 3 часа'),
                      );
                    },
                    child: const Text(
                      'Пакет на 3 часа',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        FinalBookingWidget.routeName,
                        arguments: Argument(
                            title: argument.title,
                            data: argument.data,
                            timestart: time,
                            placetypes: placetype,
                            packagesname: 'Пакет ночь (22:00-8:00)'),
                      );
                    },
                    child: const Text(
                      'Пакет ночь (22:00-8:00)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 40),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        FinalBookingWidget.routeName,
                        arguments: Argument(
                            title: argument.title,
                            data: argument.data,
                            timestart: time,
                            placetypes: placetype,
                            packagesname: 'Пакет на 5 часов'),
                      );
                    },
                    child: const Text(
                      'Пакет на 5 часов',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        FinalBookingWidget.routeName,
                        arguments: Argument(
                            title: argument.title,
                            data: argument.data,
                            timestart: time,
                            placetypes: placetype,
                            packagesname: 'Пакет сутки'),
                      );
                    },
                    child: const Text(
                      'Пакет сутки',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text('Стандартное место(50р/ч)'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.standart,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                placetype = 'Стандартное место';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('VIP место(75р/ч)'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.vipstandart,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                placetype = 'VIP место';
              });
            },
          ),
        ),
      ],
    );
  }
}
