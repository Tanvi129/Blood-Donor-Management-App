import 'package:blood_donor/screens/BookAppointmentScreen.dart';
import 'package:blood_donor/screens/MyProfileScreen.dart';
import 'package:blood_donor/screens/MyRecordsScreen.dart';
import 'package:flutter/material.dart';

class BotttomNavBar extends StatefulWidget {
  const BotttomNavBar({Key? key}) : super(key: key);

  @override
  State<BotttomNavBar> createState() => _BotttomNavBarState();
}

class _BotttomNavBarState extends State<BotttomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _returnScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Book Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'My Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  _returnScreen(int atIndex){
    if(atIndex==0){
      return BookAppointmentScreen();
    }
    if(atIndex == 1){
      return MyRecordsScreen();
    }
    if(atIndex == 2){
      return MyProfileScreen();
    }
  }
}
