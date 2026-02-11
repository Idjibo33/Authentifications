import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeconnexionService {
  final AuthService _authService = AuthService();
  Future<void> deconnecter() async {
    try {
      await _authService.firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }
}
