import 'package:firebase/Functions/renitialiser_pw_utilisateur.dart';
import 'package:firebase/Providers/pw_reinitialisation_service_provider.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class RenitialisationPage extends StatelessWidget {
  const RenitialisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroWidget(texte: "Renitialisation du mot de passe"),
              Gap(20),
              CustomTextfield(
                titre: "Email",
                fieldController: emailController,
                labelTexte: "Entrez votre email",
              ),
              Gap(16),
              Consumer<PwReinitialisationServiceProvider>(
                builder: (context, value, child) => CustomBouton(
                  texte: "Envoyé lien de rénitialisation",
                  action: () =>
                      renitialiserPw(context, email: emailController.text),
                  chargement: value.chargement,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
