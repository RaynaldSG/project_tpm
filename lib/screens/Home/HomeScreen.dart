import 'package:flutter/material.dart';
import 'package:project_tpm/screens/Home/Main/HomeMainScreen.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomeMainScreen()
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.hotel,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark,), label: 'Bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.book,), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorPallete.primaryColor,
        unselectedItemColor: ColorPallete.thirdColor,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
