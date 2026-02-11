// Inscrire l'utilisateur
import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/model/Navigations/naviguer_splash_page.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:flutter/material.dart';

Future<void> inscrireUtilisateur({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  final InscriptionProvider inscriptionProvider = InscriptionProvider();
  try {
    final inscription = await inscriptionProvider.inscrireUtilisateur(
      email: email,
      password: password,
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
