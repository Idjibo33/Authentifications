import 'package:firebase/Providers/connexion_service_provider.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:flutter/material.dart';

Future<void> connecterUtilisateur({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  final ConnexionServiceProvider auth = ConnexionServiceProvider();
  try {
    final bool connexion = await auth.connecterUtilisateur(
      email: email,
      password: password,
    );
    if (connexion) {
      if (context.mounted) {
        SnackBarService.succes(context, auth.message);
      }
    } else {
      if (context.mounted) {
        SnackBarService.error(context, auth.message);
      }
    }
  } catch (e) {
    if (context.mounted) {
      SnackBarService.error(context, auth.message);
    }
  }
}
