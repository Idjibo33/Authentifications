import 'package:firebase/Services/utilisateur_service.dart';
import 'package:firebase/model/utilisateur.dart';
import 'package:flutter/foundation.dart';

class UtilisateurProvider extends ChangeNotifier {
  final UtilisateurService _utilisateurService = UtilisateurService();
  Utilisateur? _utilisateur;
  String? _messageErreur;

  String? get messageErreur => _messageErreur;
  Utilisateur? get utilisateur => _utilisateur;

  //Lire les informations de l'utilisateur
  Future lireInfoUtilisateur() async {
    try {
      var resultat = await _utilisateurService.lireInfoUtilisateurs();
      if (resultat != null) {
        _utilisateur = Utilisateur.fromMap(resultat!);
        notifyListeners();
      } else {
        _messageErreur = "Une erreur est survenue";
        notifyListeners();
      }
      return false;
    } catch (e) {
      _messageErreur = e.toString();
      notifyListeners();
      return false;
    }
  }
}
