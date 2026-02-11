import 'package:firebase/Functions/gerer_exception_connexion.dart';
import 'package:firebase/Services/Authentification%20Services/connexion_service.dart';
import 'package:flutter/material.dart';

class ConnexionServiceProvider extends ChangeNotifier {
  final ConnexionService _connexionService = ConnexionService();
  bool _chargement = false;
  String _message = "";
  bool get chargement => _chargement;
  String get message => _message;
  Future connecterUtilisateur({
    required String email,
    required String password,
  }) async {
    _chargement = true;
    notifyListeners();
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _connexionService.connecterUtilisateur(
          email: email.trim(),
          password: password.trim(),
        );
        _chargement = false;
        _message = "Succès";
        notifyListeners();
      } else {
        _chargement = false;
        _message = "Veuillez remplir tous les champs";
        notifyListeners();
      }
    } catch (e) {
      _chargement = false;
      _message = gererExceptionConnexion(e.toString());
      notifyListeners();
    }
  }
}
