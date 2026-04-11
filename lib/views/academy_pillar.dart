import 'package:flutter/material.dart';

class AcademyPillarScreen extends StatelessWidget {
  const AcademyPillarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('HUNTER ACADEMY')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCourseCategory('Programming', [
            'Flutter Masterclass',
            'Python for AI',
            'Dart Fundamentals',
          ]),
          const SizedBox(height: 24),
          _buildCourseCategory('Design', [
            'UI/UX with Figma',
            'Motion Graphics',
          ]),
        ],
      ),
    );
  }

  Widget _buildCourseCategory(String category, List<String> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...courses.map((course) => Card(
          color: const Color(0xFF1A1A1A),
          child: ListTile(
            leading: const Icon(Icons.video_library, color: Colors.blueGrey),
            title: Text(course),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        )).toList(),
      ],
    );
  }
}
