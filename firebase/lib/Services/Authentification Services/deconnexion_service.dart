import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeconnexionService {
  final AuthService authService = AuthService();
  Future<void> deconnecter() async {
    try {
      await authService.firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }
}
