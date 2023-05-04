import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_mobile_app/ui/modules/home/home_widget.dart';
import 'package:movies_mobile_app/ui/modules/home/search_widget.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    SearchWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {

      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.primaryColor,
          onTap: _onItemTapped,
        ),
        body: _widgetOptions[_selectedIndex],
      ),
    );
  }
}
