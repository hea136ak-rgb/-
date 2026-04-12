import 'package:flutter/material.dart';
import '../models/stats.dart';
import '../services/leveling_service.dart';

class UserState extends ChangeNotifier {
  final LevelingService _levelingService = LevelingService();

  Stats _stats = Stats();
  String _name = "HUNTER";

  Stats get stats => _stats;
  String get name => _name;

  void addXp(int amount) {
    _stats = _levelingService.gainXp(_stats, amount);
    notifyListeners();
  }

  void updateProfile(String name) {
    _name = name;
    notifyListeners();
  }
}
