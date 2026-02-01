import 'package:firebase/Services/Authentification%20Services/deconnexion_service.dart';
import 'package:flutter/foundation.dart';

class DeconnexionServiceProvider extends ChangeNotifier {
  final DeconnexionService deconnexionService = DeconnexionService();
  String? _message;
  bool _chargement = false;

  String? get message => _message;
  bool get chargement => _chargement;
  Future<bool> deconnecterUtilisateur() async {
    _chargement = false;
    notifyListeners();
    try {
      await deconnexionService.deconnecter();
      _chargement = false;
      _message = "Deconnecté avec succès";
      notifyListeners();
      return true;
    } catch (e) {
      _chargement = false;
      _message = e.toString();
      return false;
    }
  }
}
