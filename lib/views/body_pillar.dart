import 'package:flutter/material.dart';

class BodyPillarScreen extends StatelessWidget {
  const BodyPillarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('BODY DEVELOPMENT'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExerciseCard('Push-ups', '100 Reps', Icons.fitness_center),
            const SizedBox(height: 16),
            _buildExerciseCard('Sit-ups', '100 Reps', Icons.accessibility_new),
            const SizedBox(height: 16),
            _buildExerciseCard('Running', '10 km', Icons.directions_run),
            const Spacer(),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, color: Colors.blueAccent, size: 48),
                  SizedBox(height: 16),
                  Text('AI CAMERA INITIALIZING...', style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String title, String goal, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.redAccent),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text('GOAL: $goal', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.check_circle_outline, color: Colors.grey),
        ],
      ),
    );
  }
}
