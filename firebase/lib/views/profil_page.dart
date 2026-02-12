import 'package:firebase/Functions/deconnecter_utilisateur.dart';
import 'package:firebase/Providers/deconnexion_service_provider.dart';
import 'package:firebase/Providers/utilisateur_provider.dart';
import 'package:firebase/views/widgets/custom_bouton.dart';
import 'package:firebase/views/widgets/details_widgets.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    UtilisateurProvider().lireInfoUtilisateur();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Consumer<UtilisateurProvider>(
        builder: (context, value, child) => FutureBuilder(
          future: value.lireInfoUtilisateur(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<UtilisateurProvider>()
                          .lireInfoUtilisateur(),
                      child: HeroWidget(texte: "Profil"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(radius: 50),
                        DetailsWidgets(
                          titre: "Identifiant de l'utilisateur",
                          donnee: value.utilisateur!.id!,
                        ),
                        DetailsWidgets(
                          titre: "Nom de l'utilisateur",
                          donnee: value.utilisateur!.nom!,
                        ),
                        DetailsWidgets(
                          titre: "Prenom de l'utilisateur",
                          donnee: value.utilisateur!.prenom!,
                        ),
                        DetailsWidgets(
                          titre: "email de l'utilisateur",
                          donnee: value.utilisateur!.email!,
                        ),
                      ],
                    ),
                    Consumer<DeconnexionServiceProvider>(
                      builder: (context, value, child) => CustomBouton(
                        texte: "Se déconnecter",
                        action: () => deconnecterUtilisateur(context),
                        chargement: value.chargement,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(value.messageErreur!));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
