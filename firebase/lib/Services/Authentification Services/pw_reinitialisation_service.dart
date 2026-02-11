import 'package:firebase/Services/Authentification%20Services/auth_service.dart';

class PwReinitialisationService {
  final AuthService _authService = AuthService();
  Future<void> reinitialiserMotDePasse({required String email}) async {
    try {
      await _authService.firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
