import 'package:firebase/Services/Authentification%20Services/inscription_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InscriptionProvider extends ChangeNotifier {
  final InscriptionService inscriptionService = InscriptionService();
  String _message = "";
  bool _chargement = false;
  String? get message => _message;
  bool get chargement => _chargement;

  //Inscrire l'utilisateur
  Future<bool> inscrireUtilisateur({
    required String email,
    required String password,
  }) async {
    _chargement = true;
    notifyListeners();
    try {
      if (email.isEmpty || password.isEmpty) {
        _chargement = false;
        _message = "Entrez un adresse email valide et un mot de passe";
        notifyListeners();
        return false;
      }
      await inscriptionService.creerCompte(
        email: email.trim(),
        password: password.trim(),
      );
      _chargement = false;
      _message = "Succès";
      return true;
    } catch (e) {
      _chargement = false;
      _message = gererErreur(e.toString());
      notifyListeners();
      return false;
    }
  }

  String gererErreur(String e) {
    switch (e) {
      case "Exception: [firebase_auth/invalid-email] The email address is badly formatted.":
        return "Entrez un e-mail valide";
      case "Exception: [firebase_auth/email-already-in-use] The email address is already in use by another account.":
        return "Il existe un compte avec cet email, connectez-vous avec";
      case "Exception: [firebase_auth/weak-password] Password should be at least 6 characters":
        return "Le mot de passe doit avoir au minimum 6 caractères";
      default:
        return "Une erreur est survenue";
    }
  }
}
