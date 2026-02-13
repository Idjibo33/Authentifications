import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/model/Navigations/naviguer_splash_page.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future inscrireUtilisateurInvite(BuildContext context) async {
  final InscriptionProvider inscriptionProvider =
      Provider.of<InscriptionProvider>(context, listen: false);
  try {
    final bool inscription = await inscriptionProvider
        .inscrireUtilisateurCommeInvite();
    if (inscription) {
      if (context.mounted) {
        SnackBarService.succes(context, inscriptionProvider.message);
        naviguerSplashPage(context);
      } else {
        if (context.mounted) {
          SnackBarService.error(context, inscriptionProvider.message);
        }
      }
    }
  } catch (e) {
    if (context.mounted) {
      SnackBarService.error(context, inscriptionProvider.message);
    }
  }
}
