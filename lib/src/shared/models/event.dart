class Event {
  Event({
    required this.eventID,
    required this.eventName,
    required this.eventDate,
    required this.finalEventDate,
    required this.eventMaxScore,
    this.rankingId,
  });

  final String eventID;
  final String eventName;
  final DateTime eventDate;
  final DateTime finalEventDate;
  final num eventMaxScore;
  final String? rankingId;
}
