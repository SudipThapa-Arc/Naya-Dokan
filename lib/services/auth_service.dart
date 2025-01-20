import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static const String _baseUrl = 'YOUR_BACKEND_URL';
  final _auth = FirebaseAuth.instance;

  Future<String> getAuthToken(String uid) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/auth/token'),
      body: json.encode({'uid': uid}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token'];
    }
    throw Exception('Failed to get auth token');
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
