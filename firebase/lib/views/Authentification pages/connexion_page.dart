import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(
                color: Colors.grey,
                child: HeroWidget(texte: "Connexion"),
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
              CustomBouton(
                texte: "S'inscrire",
                action: () {},
                chargement: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
