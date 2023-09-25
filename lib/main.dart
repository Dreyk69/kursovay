import 'package:flutter/material.dart';
import 'package:kursovay/widgets/auth/auth_widget.dart';
import 'package:kursovay/widgets/calendar/calendar_widget.dart';
import 'package:kursovay/widgets/final_booking/final_booking_widget.dart';
import 'package:kursovay/widgets/main_screen/main_screen_widget.dart';
import 'package:kursovay/widgets/refill/refill_widget.dart';
import 'package:kursovay/widgets/registration/registration_widget.dart';
import 'package:kursovay/widgets/timing/timing_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
        RefillWidget.routeName: (context) => const RefillWidget(),
        CalendarWidget.routeName: (context) => const CalendarWidget(),
        TimingWidget.routeName: (fcontext) => const TimingWidget(),
        FinalBookingWidget.routeName: (context) => const FinalBookingWidget(),
        RegistrationWidget.routeName: (context) => const RegistrationWidget(),
      },
      initialRoute: '/auth',
    );
  }
}
