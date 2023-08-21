import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scooter Info Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scooter Info'),
        ),
        body: InfoSection(),
      ),
    );
  }
}

class InfoSection extends StatefulWidget {
  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  bool startScooter = false;
  bool headlightOn = false;
  bool bootSpaceOpen = false;
  bool alarmOn = false;

  void toggleStartScooter() {
    setState(() {
      startScooter = !startScooter;
    });
  }

  void toggleHeadlight() {
    setState(() {
      headlightOn = !headlightOn;
    });
  }

  void toggleBootSpace() {
    setState(() {
      bootSpaceOpen = !bootSpaceOpen;
    });
  }

  void toggleAlarm() {
    setState(() {
      alarmOn = !alarmOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bluetooth,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Connect Your Scooter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            height: 120, // Adjust the height as needed
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ControlBox(
                    title: 'Start Scooter',
                    isActive: startScooter,
                    onTap: toggleStartScooter,
                  ),
                  SizedBox(width: 20),
                  ControlBox(
                    title: 'On Headlight',
                    isActive: headlightOn,
                    onTap: toggleHeadlight,
                  ),
                  SizedBox(width: 20),
                  ControlBox(
                    title: 'Open Bootspace',
                    isActive: bootSpaceOpen,
                    onTap: toggleBootSpace,
                  ),
                  SizedBox(width: 20),
                  ControlBox(
                    title: 'On Alarm',
                    isActive: alarmOn,
                    onTap: toggleAlarm,
                  ),
                ],
              ),
            ),
          ),
        ),
        InfoCard(
          title: 'Available Range',
          value: '250 Km',
        ),
        InfoCard(
          title: 'Available Fuel',
          value: '80%',
        ),
        InfoCard(
          title: 'Fuel Tank Temperature',
          value: '30°C',
        ),
        InfoCard(
          title: 'Location',
          value: 'Dayananda Sagar Institution',
        ),
        InfoCard(
          title: 'Nearest Maintenance Stations',
          value: '2 Km',
        ),
      ],
    );
  }
}

class ControlBox extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onTap;

  ControlBox({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              isActive ? Icons.check_circle : Icons.circle,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
