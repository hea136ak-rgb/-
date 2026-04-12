import 'package:flutter/material.dart';

class MindPillarScreen extends StatelessWidget {
  const MindPillarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('MIND PALACE')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildBookTile('Atomic Habits', 'James Clear', true),
          _buildBookTile('Thinking Fast and Slow', 'Daniel Kahneman', true),
          _buildBookTile('The Power of Now', 'Eckhart Tolle', false),
          const SizedBox(height: 32),
          const Text('POMODORO TIMER', style: TextStyle(color: Colors.blueAccent)),
          const SizedBox(height: 16),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
            ),
            child: const Center(
              child: Text('25:00', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookTile(String title, String author, bool isLocked) {
    return ListTile(
      tileColor: const Color(0xFF1A1A1A),
      leading: const Icon(Icons.book, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(author, style: const TextStyle(color: Colors.grey)),
      trailing: isLocked
        ? const Icon(Icons.lock, color: Colors.amberAccent)
        : const Icon(Icons.play_arrow, color: Colors.greenAccent),
      onTap: () {
        if (isLocked) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF1A1A1A),
              title: const Text('SYSTEM LOCK', style: TextStyle(color: Colors.redAccent)),
              content: const Text('Complete the knowledge quiz to unlock this book.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('START QUIZ', style: TextStyle(color: Colors.blueAccent)),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
