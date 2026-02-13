import 'package:firebase/Functions/inscrire_utilisateur_avec_email.dart';
import 'package:firebase/Functions/inscrire_utilisateur_invite.dart';
import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/custom_text_button.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nomController = TextEditingController();
    TextEditingController prenomController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    TextEditingController pwConfConfirmController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title(
                  color: Colors.grey,
                  child: HeroWidget(texte: "Inscription"),
                ),
                Gap(16),
                CustomTextfield(
                  titre: "Nom",
                  fieldController: nomController,
                  labelTexte: "Entrez votre nom",
                ),
                CustomTextfield(
                  titre: "Prenom",
                  fieldController: prenomController,
                  labelTexte: "Entrez votre prenom",
                ),
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
                CustomTextfield(
                  titre: "Password",
                  fieldController: pwConfConfirmController,
                  labelTexte: "Confirmez votre mot de passe",
                ),
                Gap(20),
                Consumer<InscriptionProvider>(
                  builder: (context, value, child) => CustomBouton(
                    texte: "S'inscrire",
                    action: () => inscrireUtilisateurAvecEmail(
                      context: context,
                      nom: nomController.text,
                      prenom: prenomController.text,
                      email: emailController.text,
                      password: pwController.text,
                      passwordConfirmation: pwConfConfirmController.text,
                    ),
                    chargement: value.chargement,
                  ),
                ),
                Consumer<InscriptionProvider>(
                  builder: (context, value, child) => CustomTextButton(
                    texte: "Continuer en tant qu'invité",
                    chargement: value.chargement,
                    action: () {
                      inscrireUtilisateurInvite(context);
                    },
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
