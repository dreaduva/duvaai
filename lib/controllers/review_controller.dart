import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GoogleReviewsController extends GetxController {
  Future<void> fetchReviews() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    final docSnapshot = await userDoc.get();
    final data = docSnapshot.data();
    if (data == null) return;

    final accessToken = data['accessToken'];
    final accountId = data['accountId'];

    final response = await http.get(
      Uri.parse(
          'https://mybusiness.googleapis.com/v4/accounts/$accountId/reviews'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final reviews = json.decode(response.body)['reviews'];
      for (var review in reviews) {
        await processReview(review);
      }
    }
  }

  Future<void> processReview(Map<String, dynamic> review) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final reviewId = review['reviewId'];
    final reviewDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('reviews')
        .doc(reviewId);

    final docSnapshot = await reviewDoc.get();
    if (!docSnapshot.exists) {
      await reviewDoc.set(review);
      await generateReply(review);
    }
  }

  Future<void> generateReply(Map<String, dynamic> review) async {
    final reviewText = review['comment'];

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_OPENAI_API_KEY',
      },
      body: json.encode({
        'prompt': reviewText,
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      final reply = json.decode(response.body)['choices'][0]['text'];

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final reviewId = review['reviewId'];
      final replyDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('reviews')
          .doc(reviewId)
          .collection('replies')
          .doc();

      await replyDoc.set({
        'reply': reply,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}
