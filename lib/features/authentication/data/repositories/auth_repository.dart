import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository(this.auth, this.firestore);

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<UserModel?> getCurrentUser() async {
    final user = auth.currentUser;
    if (user != null) {
      final doc = await firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await auth.signOut();
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

      final doc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      throw handleAuthException(e);
    }
  }

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
        createdAt: DateTime.now(),
      );

      await firestore.collection('users').doc(user.id).set(user.toJson());
      await userCredential.user?.updateDisplayName(name);

      return user;
    } catch (e) {
      throw handleAuthException(e);
    }
  }

  String handleAuthException(dynamic e) {
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
