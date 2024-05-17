
import 'package:cloud_firestore/cloud_firestore.dart';

class Automation {
  final String id;
  final String type;
  final bool isActive;
  final DateTime lastRun;

  Automation({
    required this.id,
    required this.type,
    required this.isActive,
    required this.lastRun,
  });

  factory Automation.fromMap(Map<String, dynamic> data, String documentId) {
    return Automation(
      id: documentId,
      type: data['type'] ?? '',
      isActive: data['isActive'] ?? false,
      lastRun: (data['lastRun'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'isActive': isActive,
      'lastRun': lastRun,
    };
  }
}
