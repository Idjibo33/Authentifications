import 'package:firebase/Services/Authentification%20Services/auth_service.dart';
import 'package:firebase/Services/Firestore%20services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InscriptionService {
  final _auth = AuthService().firebaseAuth;

  //Créer un compte d'utilisateur
  Future<UserCredential?> creerCompte({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  //AJouter les informations de l'utilisateur
  Future ajouterInfosUtiliseur({
    required String id,
    required String nom,
    required String prenom,
    required String email,
    required UserCredential utilisateur,
  }) async {
    final infos = {"id": id, "nom": nom, "prenom": prenom, "email": email};
    try {
      await FirestoreServices().firestore
          .collection('users')
          .doc(utilisateur.user!.uid)
          .set(infos);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
