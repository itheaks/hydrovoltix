import 'package:flutter/material.dart';

class CareSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Care',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'For any queries or assistance, please contact our customer support:',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            'Email: help@hydroScooter.com',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            'Phone: 8965-221-258',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 24.0),
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          FAQCard(
            question: 'What is a hydrogen fuel-based scooter?',
            answer:
            'A hydrogen fuel-based scooter is a vehicle that uses hydrogen gas as a fuel source to power its motor, emitting only water vapor as a byproduct.',
          ),
          FAQCard(
            question: 'How does the super capacitor work?',
            answer:
            'The super capacitor stores and releases energy quickly, providing short bursts of power for acceleration and regenerative braking.',
          ),
          // Add more FAQCards as needed
        ],
      ),
    );
  }
}

class FAQCard extends StatelessWidget {
  final String question;
  final String answer;

  FAQCard({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(answer),
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
        title: Text('HydroScooter Customer Care'),
        backgroundColor: Colors.blue,
      ),
      body: CareSection(),
    ),
  ));
}
