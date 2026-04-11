import 'package:flutter_test/flutter_test.dart';
import 'package:solo_leveling/models/stats.dart';
import 'package:solo_leveling/services/leveling_service.dart';

void main() {
  group('LevelingService Tests', () {
    late LevelingService levelingService;

    setUp(() {
      levelingService = LevelingService();
    });

    test('Initial stats should be level 1 and Rank E', () {
      final stats = Stats();
      expect(stats.level, 1);
      expect(stats.rank, PlayerRank.E);
    });

    test('Gaining XP should increase level when threshold is met', () {
      final initialStats = Stats(xp: 0, nextLevelXp: 100, level: 1);
      final newStats = levelingService.gainXp(initialStats, 150);

      expect(newStats.level, 2);
      expect(newStats.xp, 50); // 150 - 100 = 50
    });

    test('Rank should upgrade at level 20', () {
      final stats = Stats(level: 19, xp: 90, nextLevelXp: 100);
      final newStats = levelingService.gainXp(stats, 10);

      expect(newStats.level, 20);
      expect(newStats.rank, PlayerRank.D);
    });
  });
}
