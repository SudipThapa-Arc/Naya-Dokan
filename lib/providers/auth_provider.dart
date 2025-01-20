// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/authentication/data/repositories/auth_repository.dart';
import '../services/auth_service.dart';

final authProvider = Provider((ref) => FirebaseAuth.instance);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authProvider).authStateChanges();
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(repository);
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _repository;

  AuthController(this._repository) : super(const AsyncValue.data(null));

  Future<void> signIn(String email, String password) async {
    try {
      state = const AsyncValue.loading();
      await _repository.signIn(email: email, password: password);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(
          _repository.handleAuthException(e), StackTrace.current);
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      state = const AsyncValue.loading();
      await _repository.signUp(
        email: email,
        password: password,
        name: name,
      );
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(
          _repository.handleAuthException(e), StackTrace.current);
    }
  }

  Future<void> signOut() async {
    try {
      state = const AsyncValue.loading();
      await _repository.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
