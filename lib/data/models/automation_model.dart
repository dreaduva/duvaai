enum AutomationType { facebookPost, instagramPost, googleReview, seoAnalysis }

class Automation {
  final String id;
  final String name;
  final AutomationType type;
  final bool isActive;
  final DateTime lastRun;

  Automation({
    required this.id,
    required this.name,
    required this.type,
    required this.isActive,
    required this.lastRun,
  });

  factory Automation.fromMap(Map<String, dynamic> map) {
    return Automation(
      id: map['id'],
      name: map['name'],
      type: AutomationType.values[map['type']],
      isActive: map['isActive'],
      lastRun: DateTime.parse(map['lastRun']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type.index,
      'isActive': isActive,
      'lastRun': lastRun.toIso8601String(),
    };
  }
}
