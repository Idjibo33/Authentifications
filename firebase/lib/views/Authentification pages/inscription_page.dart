import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/model/Navigations/naviguer_connexion_page.dart';
import 'package:firebase/model/Notifications/snack_bar_services.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    Future<void> action({
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(
                color: Colors.grey,
                child: HeroWidget(texte: "Inscription"),
              ),
              Gap(50),
              CustomTextfield(
                titre: "Email",
                fieldController: emailController,
                labelTexte: "Entrez votre email",
              ),
              CustomTextfield(
                titre: "Password",
                fieldController: pwController,
                labelTexte: "Entrez votre mot de passe",
              ),
              Consumer<InscriptionProvider>(
                builder: (context, value, child) => CustomBouton(
                  texte: "S'inscrire",
                  action: () => action(
                    email: emailController.text,
                    password: pwController.text,
                  ),
                  chargement: value.chargement,
                ),
              ),
              TextButton(
                onPressed: () {
                  naviguerConnexionPage(context);
                },
                child: Text(
                  "Se connecter",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
