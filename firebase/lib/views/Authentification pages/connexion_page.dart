import 'package:firebase/Functions/connecter_utilisateur.dart';
import 'package:firebase/Providers/connexion_service_provider.dart';
import 'package:firebase/model/Navigations/naviguer_connexion_page.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          child: SingleChildScrollView(
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
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Mot de passe oublié ?",
                      style: GoogleFonts.roboto(fontSize: 12),
                    ),
                  ),
                ),
                Consumer<ConnexionServiceProvider>(
                  builder: (context, value, child) => CustomBouton(
                    texte: "Se connecter",
                    action: () => connecterUtilisateur(
                      context: context,
                      email: emailController.text,
                      password: pwController.text,
                    ),
                    chargement: value.chargement,
                  ),
                ),
            
                TextButton(
                  onPressed: () {
                    naviguerInscriptionPage(context);
                  },
                  child: Text(
                    "Créer un compte",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
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
