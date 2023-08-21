import 'package:flutter/material.dart';
import 'model.dart'; // Import your section .dart files here
import 'info.dart';
import 'care.dart';
import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydrogen Scooter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    ModelSection(),
    InfoSection(),
    CareSection(),
    UserSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydrogen Scooter'),
      ),
      backgroundColor: Colors.blue, // Set the background color of the screen
      body: _sections[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.blue, // Set the background color of the navigation bar
        selectedItemColor: Colors.black, // Set the selected item color
        unselectedItemColor: Colors.grey, // Set the unselected item color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Model Feature',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Scooter Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Customer Care / FAQs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Profile Data',
          ),
        ],
      ),
    );
  }
}
