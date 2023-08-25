import 'package:flutter/material.dart';
import '../booking/booking_widget.dart';
import '../menu/menu_widget.dart';
import '../profile/profile_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  late final String title;
  late String _title;

  static final List<Widget> _widgetOption = <Widget>[
    const ProfileWidget(),
    BookingWidget(),
    MenuWidget(),
  ];
  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
      switch (index) {
        case 0:
          {
            _title = 'Ваш профиль';
          }
          break;
        case 1:
          {
            _title = 'Выбрать центр';
          }
          break;
        case 2:
          {
            _title = 'Меню';
          }
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _title = 'Ваш профиль';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: _widgetOption[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Бронирование',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dehaze),
            label: 'Меню',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
