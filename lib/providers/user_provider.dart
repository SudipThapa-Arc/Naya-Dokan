import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'auth_provider.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return UserNotifier(authService);
});

class UserNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;

  UserNotifier(this._authService) : super(const AsyncValue.loading()) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      state = AsyncValue.data(user);
    });
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
