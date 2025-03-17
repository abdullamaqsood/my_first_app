class Mission {
  final String missionName;
  final String description;
  final List<String> payloadIds;

  Mission(
      {required this.missionName,
      required this.description,
      required this.payloadIds});

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      missionName: json['mission_name'] ?? '',
      description: json['description'] ?? '',
      payloadIds: List<String>.from(json['payload_ids'] ?? []),
    );
  }
}
