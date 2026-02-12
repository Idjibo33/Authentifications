import 'package:firebase/Services/utilisateur_service.dart';
import 'package:firebase/model/utilisateur.dart';
import 'package:flutter/foundation.dart';

class UtilisateurProvider extends ChangeNotifier {
  final UtilisateurService _utilisateurService = UtilisateurService();
  Utilisateur _utilisateur = Utilisateur();
  String _messageErreur = "";

  String get messageErreur => _messageErreur;
  Utilisateur get utilisateur => _utilisateur;

  //Lire les informations de l'utilisateur
  Future<bool> lireInfoUtilisateur() async {
    try {
      final resultat = await _utilisateurService.lireInfoUtilisateurs();
      _utilisateur = Utilisateur.fromMap(resultat);
      print(_utilisateur);
      notifyListeners();
      return true;
    } catch (e) {
      _messageErreur = e.toString();
      notifyListeners();
      throw Exception(e);
    }
  }
}
