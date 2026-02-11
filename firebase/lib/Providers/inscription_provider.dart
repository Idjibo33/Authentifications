import 'package:firebase/Functions/gerer_exception_inscription.dart';
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
    debugPrint(chargement.toString());
    _chargement = true;
    notifyListeners();
    debugPrint(chargement.toString());
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
