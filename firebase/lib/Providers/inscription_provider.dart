import 'package:firebase/Functions/gerer_exception_inscription.dart';
import 'package:firebase/Services/Authentification%20Services/inscription_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InscriptionProvider extends ChangeNotifier {
  final InscriptionService _inscriptionService = InscriptionService();
  String _message = "";
  bool _chargement = false;
  String? get message => _message;
  bool get chargement => _chargement;

  //Inscrire l'utilisateur
  Future<bool> inscrireUtilisateur({
    required String prenom,
    required String nom,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    debugPrint(chargement.toString());
    _chargement = true;
    notifyListeners();
    debugPrint(chargement.toString());
    try {
      if (email.isEmpty || password.isEmpty || passwordConfirmation.isEmpty) {
        _chargement = false;
        _message = "Entrez un adresse email valide et un mot de passe";
        notifyListeners();
        return false;
      }
      if (password != passwordConfirmation) {
        _chargement = false;
        _message = "Les mots de passe ne correspondent pas";
        notifyListeners();
        return false;
      }
      UserCredential? utilisateur = await _inscriptionService.creerCompte(
        email: email.trim(),
        password: password.trim(),
      );
      await _inscriptionService.ajouterInfosUtiliseur(
        utilisateur: utilisateur!,
        id: utilisateur.user!.uid,
        nom: nom.trim(),
        email: email,
        prenom: prenom.trim(),
      );
      _chargement = false;
      _message = "Succès";
      debugPrint("$nom | $prenom | $email | $password");
      notifyListeners();
      return true;
    } catch (e) {
      _chargement = false;
      _message = gererExceptionInscription(e.toString());
      notifyListeners();
      return false;
    }
  }
}
