import 'package:flutter/material.dart';

class RefillWidget extends StatelessWidget {
  const RefillWidget({super.key});
  static const routeName = '/main_screen/refill_widget';

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(color: Colors.black, fontSize: 14);
    const _textStyle2 = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пополнение счета'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ColoredBox(
              color: const Color.fromARGB(217, 255, 255, 255),
              child: Column(children: [
                const SizedBox(height: 25),
                const Text(
                  'Сумма пополнения',
                  style: _textStyle,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          alignment: Alignment.center,
                          child: const TextField(
                            cursorColor: Colors.blue,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                            ),
                          )),
                    ),
                    const SizedBox(width: 5),
                    const Text('р.', style: _textStyle2)
                  ],
                ),
                const SizedBox(height: 30),
                const Text('Воспользуйтесь для быстрого пополнения',
                    style: _textStyle),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        child: const Text('+100 руб',
                            style: TextStyle(color: Colors.black))),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        child: const Text('+500 руб',
                            style: TextStyle(color: Colors.black))),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        child: const Text('+1000 руб',
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Баланс после пополнения', style: _textStyle),
                const Text('0 р.', style: _textStyle2),
                const SizedBox(height: 10),
              ]),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(13)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text('Пополнить счет',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
