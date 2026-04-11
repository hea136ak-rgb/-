import '../models/user.dart';

class ProfilingService {
  /// Analyzes psychological and physical data to set initial goals
  Map<String, dynamic> analyzeProfile({
    required double height,
    required double weight,
    required List<String> psychologicalAnswers,
    required List<String> goalInterests,
  }) {
    // Basic BMI calculation logic
    double bmi = weight / ((height / 100) * (height / 100));

    // Strengths and weaknesses analysis (placeholder)
    String focusArea = _determineFocusArea(psychologicalAnswers);

    return {
      'bmi': bmi,
      'focus_area': focusArea,
      'initial_rank': 'E',
      'suggested_tasks': _getSuggestedTasks(focusArea),
    };
  }

  String _determineFocusArea(List<String> answers) {
    // Basic analysis of psychological answers
    int physicalCount = 0;
    int mentalCount = 0;

    for (var answer in answers) {
      if (answer.toLowerCase().contains('weak') || answer.toLowerCase().contains('lazy')) {
        physicalCount++;
      } else if (answer.toLowerCase().contains('stress') || answer.toLowerCase().contains('focus')) {
        mentalCount++;
      }
    }

    return physicalCount >= mentalCount ? 'Physical' : 'Mental';
  }

  List<String> _getSuggestedTasks(String focusArea) {
    if (focusArea == 'Physical') {
      return [
        '10 Pushups (10 ضغط)',
        '10 Situps (10 بطن)',
        '1km Run (جري 1 كم)'
      ];
    } else {
      return [
        '5min Meditation (5 دقائق تأمل)',
        'Read 5 Pages (قراءة 5 صفحات)',
        'Deep Breathing (تنفس عميق)'
      ];
    }
  }
}
