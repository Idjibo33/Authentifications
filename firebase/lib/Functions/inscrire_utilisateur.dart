// Inscrire l'utilisateur
import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/model/Navigations/naviguer_splash_page.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> inscrireUtilisateur({
  required BuildContext context,
  required String nom,
  required String prenom,
  required String email,
  required String password,
  required String passwordConfirmation,
}) async {
  final InscriptionProvider inscriptionProvider =
      Provider.of<InscriptionProvider>(context, listen: false);
  try {
    final inscription = await inscriptionProvider.inscrireUtilisateur(
      nom: nom,
      prenom: prenom,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    if (context.mounted) {
      if (inscription) {
        SnackBarService.succes(context, inscriptionProvider.message);
        naviguerSplashPage(context);
      } else {
        SnackBarService.error(context, inscriptionProvider.message);
      }
    }
  } catch (e) {
    if (context.mounted) {
      SnackBarService.error(context, inscriptionProvider.message);
    }
  }
}
