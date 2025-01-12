import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository(this.auth, this.firestore);

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
      );

      await firestore.collection('users').doc(user.id).set(user.toJson());

      return user;
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      return UserModel.fromJson(userDoc.data()!);
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  String _handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'This email is already registered';
        case 'invalid-email':
          return 'Invalid email address';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled';
        case 'weak-password':
          return 'Please enter a stronger password';
        case 'user-disabled':
          return 'This account has been disabled';
        case 'user-not-found':
          return 'No user found with this email';
        case 'wrong-password':
          return 'Incorrect password';
        default:
          return 'Authentication failed';
      }
    }
    return 'An error occurred';
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
  );
});
