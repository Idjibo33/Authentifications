import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InscriptionService {
  final auth = AuthService().firebaseAuth;
  Future<UserCredential?> creerCompte({
    required String email,
    required String password,
  }) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
