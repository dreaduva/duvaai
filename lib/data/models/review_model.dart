import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String reviewerName;
  final String comment;
  final double rating;
  final DateTime reviewTime;
  final String? reply;
  final DateTime? replyTime;

  Review({
    required this.id,
    required this.reviewerName,
    required this.comment,
    required this.rating,
    required this.reviewTime,
    this.reply,
    this.replyTime,
  });

  // Convert Firestore Document to Review Model
  factory Review.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Review(
      id: doc.id,
      reviewerName: data['reviewerName'] ?? '',
      comment: data['comment'] ?? '',
      rating: data['rating']?.toDouble() ?? 0.0,
      reviewTime: (data['reviewTime'] as Timestamp).toDate(),
      reply: data['reply'],
      replyTime: data['replyTime'] != null
          ? (data['replyTime'] as Timestamp).toDate()
          : null,
    );
  }

  // Convert Review Model to Map
  Map<String, dynamic> toMap() {
    return {
      'reviewerName': reviewerName,
      'comment': comment,
      'rating': rating,
      'reviewTime': reviewTime,
      'reply': reply,
      'replyTime': replyTime,
    };
  }

  // Convert Review Model to Firestore Document
  Future<void> saveToFirestore(String userId) async {
    final reviewDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('reviews')
        .doc(id);

    await reviewDoc.set(toMap());
  }
}
