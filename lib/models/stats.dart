enum PlayerRank { E, D, C, B, A, S }

class Stats {
  final int level;
  final int xp;
  final int nextLevelXp;
  final PlayerRank rank;

  // RPG Attributes
  final int strength;
  final int agility;
  final int intelligence;
  final int vitality;
  final int perception;

  Stats({
    this.level = 1,
    this.xp = 0,
    this.nextLevelXp = 100,
    this.rank = PlayerRank.E,
    this.strength = 10,
    this.agility = 10,
    this.intelligence = 10,
    this.vitality = 10,
    this.perception = 10,
  });

  Stats copyWith({
    int? level,
    int? xp,
    int? nextLevelXp,
    PlayerRank? rank,
    int? strength,
    int? agility,
    int? intelligence,
    int? vitality,
    int? perception,
  }) {
    return Stats(
      level: level ?? this.level,
      xp: xp ?? this.xp,
      nextLevelXp: nextLevelXp ?? this.nextLevelXp,
      rank: rank ?? this.rank,
      strength: strength ?? this.strength,
      agility: agility ?? this.agility,
      intelligence: intelligence ?? this.intelligence,
      vitality: vitality ?? this.vitality,
      perception: perception ?? this.perception,
    );
  }
}
