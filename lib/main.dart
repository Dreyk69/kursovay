import 'package:flutter/material.dart';
import 'package:kursovay/widgets/auth/auth_widget.dart';
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
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/refill_widget': (context) => RefillWidget(),
        '/main_screen/calendar_widget': (context) {
          var arguments = ModalRoute.of(context)!.settings.arguments as Map;
          int id = arguments[1];
          String title = arguments[2];
          String address = arguments[3];
          if (id is int) {
            return CalendarWidget(
                addressesId: id,
                addressesTitle: title,
                addressesAddress: address);
          } else {
            return CalendarWidget(
                addressesId: 0,
                addressesTitle: title,
                addressesAddress: address);
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}
