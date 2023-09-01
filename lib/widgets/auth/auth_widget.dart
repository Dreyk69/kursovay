import 'package:flutter/material.dart';
import 'package:kursovay/resources/resources.dart';
import 'package:kursovay/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  static const routeName = '/auth';
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: const [
              _FormWidget(),
            ],
          ),
        ));
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  String? errorText = null;
  final _fioTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  void _signin() {
    final fio = _fioTextController.text;
    final password = _passwordTextController.text;
    if (fio == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed(MainScreenWidget.routeName);
    } else {
      errorText = 'Не верное ФИО или пароль';
    }
    setState(() {});
  }

  void _auth() {
    print('sign in');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 210, horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Image(image: AssetImage(AppImages.screensaver))),
          const SizedBox(height: 20),
          if (errorText != null) ...[
            Text(
              errorText,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20)
          ],
          TextField(
            controller: _fioTextController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle_rounded),
              prefixIconColor: const Color.fromARGB(255, 199, 100, 216),
              hintText: 'Введите ФИО',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordTextController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.enhanced_encryption),
              prefixIconColor: const Color.fromARGB(255, 199, 100, 216),
              hintText: 'Введите пароль',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            obscureText: true,
          ),
          TextButton(onPressed: () {}, child: const Text('Забыли пароль?')),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _signin,
              child: const Text('Войти'),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _auth,
              child: const Text('Регистрация'),
            ),
          ),
        ],
      ),
    );
  }
}
