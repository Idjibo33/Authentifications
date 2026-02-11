import 'package:firebase/Providers/pw_reinitialisation_service_provider.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void renitialiserPw(BuildContext context, {required String email}) async {
  final auth = Provider.of<PwReinitialisationServiceProvider>(
    context,
    listen: false,
  );
  try {
    final bool reinitialisation = await auth.reinitialiserMotDePasse(
      email: email,
    );
    if (reinitialisation) {
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
      SnackBarService.error(context, e.toString());
    }
  }
}
