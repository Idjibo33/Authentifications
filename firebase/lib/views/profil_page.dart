import 'package:firebase/Providers/deconnexion_service_provider.dart';
import 'package:firebase/model/Navigations/naviguer_splash_page.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeroWidget(texte: "Profil"),
                Consumer<DeconnexionServiceProvider>(
                  builder: (context, value, child) => CustomBouton(
                    texte: "Deconnexion",
                    action: () async {
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
                    },
                    chargement: value.chargement,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
