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

  //Inscrire l'utilisateur avec email et mot de passe
  Future<bool> inscrireUtilisateurAvecEmailPassword({
    required String prenom,
    required String nom,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    _chargement = true;
    notifyListeners();
    try {
      if (email.isEmpty ||
          password.isEmpty ||
          passwordConfirmation.isEmpty ||
          nom.isEmpty ||
          prenom.isEmpty) {
        _chargement = false;
        _message = "Toutes les cases sont obligatoires";
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
        id: utilisateur!.user!.uid,
        nom: nom,
        prenom: prenom,
        email: email,
        utilisateur: utilisateur,
      );
      _chargement = false;
      _message = "Succès";
      notifyListeners();
      return true;
    } catch (e) {
      _chargement = false;
      _message = gererExceptionInscription(e.toString());
      notifyListeners();
      return false;
    }
  }

  //Inscrire l'utilisateur comme invité
  Future<bool> inscrireUtilisateurCommeInvite() async {
    _chargement = true;
    notifyListeners();
    try {
      UserCredential? utilisateur = await _inscriptionService.inscrireAnonyme();
      await _inscriptionService.ajouterInfosUtiliseur(
        id: utilisateur!.user!.uid,
        nom: null,
        email: null,
        prenom: null,
        utilisateur: utilisateur,
      );
      _chargement = false;
      _message = "Connecté en tant qu'invité avec succès";
      notifyListeners();
      return true;
    } catch (e) {
      _chargement = false;
      _message = e.toString();
      notifyListeners();
      return false;
    }
  }
}
