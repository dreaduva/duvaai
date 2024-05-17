
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;
  final DateTime lastLogin;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.lastLogin,
  });

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
      lastLogin: (data['lastLogin'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'lastLogin': lastLogin,
    };
  }
}
