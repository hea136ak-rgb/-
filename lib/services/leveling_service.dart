import '../models/stats.dart';

class LevelingService {
  /// Calculates the new stats after gaining XP
  Stats gainXp(Stats currentStats, int xpGained) {
    int totalXp = currentStats.xp + xpGained;
    int level = currentStats.level;
    int nextLevelXp = currentStats.nextLevelXp;
    PlayerRank rank = currentStats.rank;

    // Level up logic
    while (totalXp >= nextLevelXp) {
      totalXp -= nextLevelXp;
      level++;
      nextLevelXp = _calculateNextLevelXp(level);
    }

    // Rank upgrade logic (simple mapping for now)
    rank = _calculateRank(level);

    // Update attributes based on level (simulated RPG progression)
    return currentStats.copyWith(
      level: level,
      xp: totalXp,
      nextLevelXp: nextLevelXp,
      rank: rank,
      strength: currentStats.strength + (level % 2 == 0 ? 1 : 0),
      agility: currentStats.agility + (level % 3 == 0 ? 1 : 0),
      intelligence: currentStats.intelligence + (level % 2 == 0 ? 1 : 0),
    );
  }

  int _calculateNextLevelXp(int level) {
    // Exponential XP curve: 100, 150, 225, 337...
    return (100 * (level * 1.5)).toInt();
  }

  PlayerRank _calculateRank(int level) {
    if (level >= 100) return PlayerRank.S;
    if (level >= 80) return PlayerRank.A;
    if (level >= 60) return PlayerRank.B;
    if (level >= 40) return PlayerRank.C;
    if (level >= 20) return PlayerRank.D;
    return PlayerRank.E;
  }
}
