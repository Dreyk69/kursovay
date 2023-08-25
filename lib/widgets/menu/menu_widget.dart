import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({super.key});

  final List<String> element = [
    "Аренда ПК",
    "Уведомления",
    "История транзакций",
    "Список адресов",
    "Инфо об оборудование",
    "Прайс лист",
    "Выход"
  ];
  final List<IconData> icons = [
    Icons.devices,
    Icons.notifications_none,
    Icons.autorenew,
    Icons.location_on,
    Icons.desktop_windows,
    Icons.assignment,
    Icons.exit_to_app
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: element.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(element[index], style: TextStyle(fontSize: 22)),
          leading: Icon(
            icons[index],
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
