import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class RegistrationWidget extends StatefulWidget {
  static const routeName = '/auth/registration_widget';
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _fioTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 210, horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Image(image: AssetImage(AppImages.screensaver))),
                  const SizedBox(height: 20),
                  const Text(
                    'Введите ваше ФИО и пароль',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 199, 100, 216),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _fioTextController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_rounded),
                      prefixIconColor:
                          const Color.fromARGB(255, 199, 100, 216),
                      hintText: 'Введите ФИО',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.enhanced_encryption),
                      prefixIconColor:
                          const Color.fromARGB(255, 199, 100, 216),
                      hintText: 'Введите пароль',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Зарегистрироваться'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
