import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildSportWidget(
              'Football', 'assets/1eb5deb4eb282a73c3703b5ede9ff53a.jpeg'),
          _buildSportWidget('Basketball', 'assets/images/basketball.png'),
          _buildSportWidget('Cricket', 'assets/images/cricket.png'),
          _buildSportWidget('Tennis', 'assets/images/tennis.png'),
        ],
      ),
    );
  }

  Widget _buildSportWidget(String name, String imagePath) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: 100,
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
