import 'package:firebase/Functions/deconnecter_utilisateur.dart';
import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/Providers/utilisateur_provider.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/details_widgets.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeroWidget(texte: "Profile Page"),
            Consumer<UtilisateurProvider>(
              builder: (context, value, child) => FutureBuilder(
                future: value.lireInfoUtilisateur(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(value.messageErreur));
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        DetailsWidgets(
                          titre: "Identifiant de l'utilisateur",
                          donnee: value.utilisateur.id ?? "Non définit",
                        ),
                        DetailsWidgets(
                          titre: "Nom de l'utilisateur",
                          donnee: value.utilisateur.nom ?? "Non définit",
                        ),
                        DetailsWidgets(
                          titre: "prenom de l'utilisateur",
                          donnee: value.utilisateur.prenom ?? "Non définit",
                        ),
                        DetailsWidgets(
                          titre: "Prenom de l'utilisateur",
                          donnee: value.utilisateur.email ?? "Non définit",
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Consumer<InscriptionProvider>(
              builder: (context, value, child) => CustomBouton(
                texte: "Se déconnecter",
                action: () => deconnecterUtilisateur(context),
                chargement: value.chargement,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
