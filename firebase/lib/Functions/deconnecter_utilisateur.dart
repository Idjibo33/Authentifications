import 'package:firebase/Providers/deconnexion_service_provider.dart';
import 'package:firebase/model/Navigations/naviguer_splash_page.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void deconnecterUtilisateur(BuildContext context) async {
  final value = Provider.of<DeconnexionServiceProvider>(context, listen: false);
  final deconnexion = await value.deconnecterUtilisateur();
  if (deconnexion) {
    if (context.mounted) {
      SnackBarService.succes(context, value.message);
      naviguerSplashPage(context);
    }
  } else {
    if (context.mounted) {
      SnackBarService.error(context, value.message);
    }
  }
}
