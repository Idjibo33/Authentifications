import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConnexionService {
  final AuthService authService = AuthService();
  //Connecter l'utilisateur
  Future<UserCredential?> connecterUtilisateur({
    required String email,
    required String password,
  }) async {
    try {
      return await authService.firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
