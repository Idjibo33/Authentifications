import 'package:firebase/Functions/inscrire_utilisateur.dart';
import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    TextEditingController pwConfConfirmController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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
                CustomTextfield(
                  titre: "Password",
                  fieldController: pwConfConfirmController,
                  labelTexte: "Entrez votre mot de passe",
                ),
                Consumer<InscriptionProvider>(
                  builder: (context, value, child) => CustomBouton(
                    texte: "S'inscrire",
                    action: () => inscrireUtilisateur(
                      context: context,
                      email: emailController.text,
                      password: pwController.text,
                      passwordConfirmation: pwConfConfirmController.text,
                    ),
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
