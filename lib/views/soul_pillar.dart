import 'package:flutter/material.dart';

class SoulPillarScreen extends StatelessWidget {
  const SoulPillarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('SOUL BALANCE')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMeditationCard('Deep Breathing', '5 Minutes', Icons.air),
            const SizedBox(height: 16),
            _buildMeditationCard('Gratitude Journal', '3 Entries', Icons.edit_note),
            const Spacer(),
            const Text(
              'DAILY MOOD',
              style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMoodIcon(Icons.sentiment_very_dissatisfied, Colors.red),
                _buildMoodIcon(Icons.sentiment_neutral, Colors.amber),
                _buildMoodIcon(Icons.sentiment_very_satisfied, Colors.green),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMeditationCard(String title, String duration, IconData icon) {
    return Card(
      color: const Color(0xFF1A1A1A),
      child: ListTile(
        leading: Icon(icon, color: Colors.purpleAccent),
        title: Text(title),
        subtitle: Text(duration),
        trailing: const Icon(Icons.play_circle_fill, color: Colors.purpleAccent),
      ),
    );
  }

  Widget _buildMoodIcon(IconData icon, Color color) {
    return IconButton(
      icon: Icon(icon, color: color, size: 40),
      onPressed: () {},
    );
  }
}
