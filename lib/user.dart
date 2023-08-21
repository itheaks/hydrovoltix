import 'package:flutter/material.dart';

class UserSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            UserProfileCard(
              user: UserProfile(
                photoUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.hindustantimes.com%2Fcities%2Fdelhi-news%2Fneed-a-holistic-plan-for-switch-to-hydrogen-based-energy-sources-experts-101631555615501.html&psig=AOvVaw0ocdJzz9DkmAQg61yKaaAS&ust=1692168423349000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCNjimeCI3oADFQAAAAAdAAAAABAE', // Replace with actual URL
                name: 'Kaustubh Kulkarni',
                email: 'Kaustubh@gmail.com',
                phoneNumber: '9638527412',
                purchaseDate: '2022-08-15',
                registrationNumber: 'ABC123',
                numberPlate: 'XY1234',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile {
  final String photoUrl;
  final String name;
  final String email;
  final String phoneNumber;
  final String purchaseDate;
  final String registrationNumber;
  final String numberPlate;

  UserProfile({
    required this.photoUrl,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.purchaseDate,
    required this.registrationNumber,
    required this.numberPlate,
  });
}

class UserProfileCard extends StatelessWidget {
  final UserProfile user;

  UserProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.photoUrl),
            radius: 50,
          ),
          SizedBox(height: 16.0),
          Text(
            user.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            user.email,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8.0),
          Text(
            user.phoneNumber,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16.0),
          Text(
            'Scooter Purchased on: ${user.purchaseDate}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8.0),
          Text(
            'Registration Number: ${user.registrationNumber}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8.0),
          Text(
            'Number Plate: ${user.numberPlate}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.blue,
      ),
      body: UserSection(),
    ),
  ));
}
