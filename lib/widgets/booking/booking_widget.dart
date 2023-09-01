import 'package:flutter/material.dart';

import '../calendar/calendar_widget.dart';

class Addresses {
  final int id;
  final String title;
  final String address;

  Addresses(this.title, this.address, this.id);
}

class AddressesListClass {
  static final addressesList = [
    Addresses(
        'Семеновская', 'м. Семеновская, улица Вельяминовская 6 (2 этаж)', 0),
    Addresses(
        'Выхино',
        'м. Выхино, улица Вешняковская 22а (ТЦ Вишняковский пассаж, 4 этаж)',
        1),
    Addresses(
        'Южная', 'м. Южная, улица Кировоградская 9к1 (ТЦ Акварель, 2 этаж)', 2),
    Addresses(
        'Щелковская', 'м. Щелковская, Щелковское шоссе 91Вс1 (2 этаж)', 3),
  ];
}

class BookingWidget extends StatelessWidget {
  BookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void _onAddressesTab(int index) {
      Navigator.of(context).pushNamed(
        CalendarWidget.routeName,
        arguments: AddressesListClass.addressesList[index],
      );
    }

    return ListView.builder(
      itemCount: AddressesListClass.addressesList.length,
      itemBuilder: (context, index) {
        final addresses = AddressesListClass.addressesList[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: const Color.fromARGB(255, 40, 40, 40),
          elevation: 20,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () => _onAddressesTab(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addresses.title,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(addresses.address,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 208, 208, 208),
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
