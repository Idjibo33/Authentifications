import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase/Services/Firestore%20services/firestore_services.dart';

class UtilisateurService {
  final FirestoreServices _firestoreServices = FirestoreServices();
  //Lire les informations de l'utilisateur
  Future? lireInfoUtilisateurs() async {
    final utilisateur = AuthService().currentUser;
    try {
      var snapshot = await _firestoreServices.firestore
          .collection('users')
          .doc(utilisateur!.uid)
          .get();
      if (snapshot.exists) {
        final donnee = snapshot.data();
        return donnee;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
