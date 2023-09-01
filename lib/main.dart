import 'package:flutter/material.dart';
import 'package:kursovay/widgets/auth/auth_widget.dart';
import 'package:kursovay/widgets/booking/booking_widget.dart';
import 'package:kursovay/widgets/calendar/calendar_widget.dart';
import 'package:kursovay/widgets/main_screen/main_screen_widget.dart';
import 'package:kursovay/widgets/refill/refill_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          secondary: Colors.blue,
          surface: Colors.black,
        ),
      ),
      routes: {
        AuthWidget.routeName: (context) => const AuthWidget(),
        MainScreenWidget.routeName: (context) => const MainScreenWidget(),
        RefillWidget.routeName: (context) => RefillWidget(),
        CalendarWidget.routeName: (context) => CalendarWidget(),
      },
      initialRoute: '/auth',
    );
  }
}
