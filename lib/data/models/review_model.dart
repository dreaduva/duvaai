
import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String userId;
  final String text;
  final int rating;
  final DateTime timestamp;

  Review({
    required this.id,
    required this.userId,
    required this.text,
    required this.rating,
    required this.timestamp,
  });

  factory Review.fromMap(Map<String, dynamic> data, String documentId) {
    return Review(
      id: documentId,
      userId: data['userId'] ?? '',
      text: data['text'] ?? '',
      rating: data['rating'] ?? 0,
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'text': text,
      'rating': rating,
      'timestamp': timestamp,
    };
  }
}
