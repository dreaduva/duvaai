import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duvaai/controllers/automations/google/google_reviews_controller.dart';

class GoogleReviewsPage extends StatelessWidget {
  final GoogleReviewsController _googleReviewsController =
      Get.put(GoogleReviewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Reviews')),
      body: Obx(() {
        if (_googleReviewsController.reviews.isEmpty) {
          return Center(child: Text('No reviews available'));
        }
        return ListView.builder(
          itemCount: _googleReviewsController.reviews.length,
          itemBuilder: (context, index) {
            final review = _googleReviewsController.reviews[index];
            return ListTile(
              title: Text(review.comment),
              subtitle: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('reviews')
                    .doc(review.id)
                    .collection('replies')
                    .doc(review.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Text('No reply yet');
                  }
                  final reply = snapshot.data!['reply'];
                  return Text('Reply: $reply');
                },
              ),
            );
          },
        );
      }),
    );
  }
}
