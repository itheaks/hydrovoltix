import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('3D Model Viewer')),
      body: ModelSection(),
    ),
  ));
}

class ModelSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Cube(
                  onSceneCreated: (Scene scene) {
                    scene.world.add(Object(fileName: 'assets/model.obj'));
                    scene.camera.zoom = 7.0;
                  },
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                FeatureCard(
                  title: "Lane Detection",
                  description:
                  "The vehicle is equipped with advanced lane detection technology that helps it stay within the lane.",
                ),
                SizedBox(height: 20),
                FeatureCard(
                  title: "Smart Brake",
                  description:
                  "The smart brake system automatically adjusts braking force to ensure a safe and comfortable driving experience.",
                ),
                SizedBox(height: 20),
                FeatureCard(
                  title: "Hydrogen Fuel",
                  description:
                  "Powered by clean hydrogen fuel, the vehicle produces zero emissions, contributing to a greener environment.",
                ),
                SizedBox(height: 20),
                FeatureCard(
                  title: "Super Capacitor",
                  description:
                  "Utilizes cutting-edge super capacitor technology for efficient energy storage and release.",
                ),
                SizedBox(height: 20),
                FeatureCard(
                  title: "Smart Lock",
                  description:
                  "The smart lock system provides enhanced security and convenience, allowing keyless entry.",
                ),
                SizedBox(height: 20),
                FeatureCard(
                  title: "Camera Automation",
                  description:
                  "Advanced camera automation ensures a safer driving experience by assisting with parking and obstacle detection.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;

  FeatureCard({required this.title, required this.description});

  @override
  _FeatureCardState createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Card(
        elevation: _isHovered ? 8 : 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
