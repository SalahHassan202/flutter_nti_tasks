class Team {
  final String idTeam;
  final String name;
  final String shortName;
  final String stadium;
  final String country;
  final String badge;
  final String description;

  Team({
    required this.idTeam,
    required this.name,
    required this.shortName,
    required this.stadium,
    required this.country,
    required this.badge,
    required this.description,
  });
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      idTeam: json['idTeam'] ?? '',
      name: json['strTeam'] ?? '',
      shortName: json['strTeamShort'] ?? '',
      stadium: json['strStadium'] ?? '',
      country: json['strCountry'] ?? '',
      badge: json['strBadge'] ?? '',
      description: json['strDescriptionEN'] ?? '',
    );
  }
}
