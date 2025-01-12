import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/authentication/data/models/user_model.dart';
import '../features/authentication/data/repositories/auth_repository.dart';

final authStateProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    // Initialize auth state
    state = const AsyncValue.loading();
    try {
      final user = _repository.auth.currentUser;
      if (user != null) {
        final userDoc =
            await _repository.firestore.collection('users').doc(user.uid).get();
        state = AsyncValue.data(UserModel.fromJson(userDoc.data()!));
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repository.signIn(
        email: email,
        password: password,
      );
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repository.signUp(
        email: email,
        password: password,
        name: name,
      );
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
    state = const AsyncValue.data(null);
  }
}
