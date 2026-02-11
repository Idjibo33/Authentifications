import 'package:firebase/Services/Authentification%20Services/pw_reinitialisation_service.dart';
import 'package:flutter/foundation.dart';

class PwReinitialisationServiceProvider extends ChangeNotifier {
  final PwReinitialisationService _pwReinitialisationService =
      PwReinitialisationService();
  bool _chargement = false;
  String? _message;
  bool get chargement => _chargement;
  String? get message => _message;
  Future<bool> reinitialiserMotDePasse({required String email}) async {
    _chargement = true;
    _message = null;
    notifyListeners();
    try {
      if (email.isEmpty) {
        _chargement = false;
        _message = "Veuillez entrer votre adresse e-mail.";
        notifyListeners();
        return false;
      }
      await _pwReinitialisationService.reinitialiserMotDePasse(email: email);
      _message = "Un e-mail de réinitialisation a été envoyé à $email.";
      _chargement = false;
      notifyListeners();
      return true;
    } catch (e) {
      _message = e.toString();
      _chargement = false;
      notifyListeners();
      return false;
    }
  }
}
