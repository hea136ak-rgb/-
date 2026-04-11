enum TaskPillar { body, soul, mind, money }

class Task {
  final String id;
  final String title;
  final String description;
  final TaskPillar pillar;
  final int xpReward;
  final bool isCompleted;
  final DateTime? completedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.pillar,
    required this.xpReward,
    this.isCompleted = false,
    this.completedAt,
  });
}
