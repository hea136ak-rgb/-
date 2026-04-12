import 'stats.dart';

class User {
  final String id;
  final String name;
  final String email;
  final double height;
  final double weight;
  final Stats stats;
  final String? chosenPersona; // Goku, Sung Jin-Woo, etc.

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.height,
    required this.weight,
    required this.stats,
    this.chosenPersona,
  });
}
