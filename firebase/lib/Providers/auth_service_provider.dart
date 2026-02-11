import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServiceProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  User? get currentUser => authService.firebaseAuth.currentUser;
  Stream<User?> get authStateChanges =>
      authService.firebaseAuth.authStateChanges();
}
