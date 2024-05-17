import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUser(User user) async {
    final userDoc = _firestore.collection('users').doc(user.id);
    await userDoc.set(user.toMap(), SetOptions(merge: true));
  }

  Stream<User> getUser(String userId) {
    return _firestore.collection('users').doc(userId).snapshots().map(
      (snapshot) => User.fromMap(snapshot.data()!, snapshot.id),
    );
  }
}
