import 'package:flutter/material.dart';
import 'package:kursovay/resources/resources.dart';

import '../refill/refill_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ColoredBox(
            color: Colors.black,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AppImages.avatar),
                                fit: BoxFit.fill),
                          )),
                      SizedBox(
                        width: 115,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text('Стандартный аккаунт',
                                                style: TextStyle(fontSize: 17)),
                                            const SizedBox(width: 45),
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(context),
                                                child: const Icon(Icons.close)),
                                          ],
                                        ),
                                        const Center(
                                          child: Text(
                                            'Стандартный аккаунт выдается всем новым пользователям и дает возможность получать кешбек в размере 5%  от всех покупок',
                                            style: TextStyle(fontSize: 17),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(width: 45),
                                      ],
                                    ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          child: const Text('СТАНДАРТ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Азовский Никита Андреевич',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('+7 929 234 52 91',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text('Баланс счета: ',
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: const Text('  0 р. '),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Баланс бонусов: ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 106, 106, 106),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Text('  500  '),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white,
            ),
            child: Center(
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(RefillWidget.routeName),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Пополнить счёт',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
