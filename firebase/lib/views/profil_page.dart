import 'package:firebase/model/User/user.dart';
import 'package:firebase/views/widgets/details_widgets.dart';
import 'package:firebase/views/widgets/divider_widget.dart';
import 'package:firebase/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  final Utilisateur utilisateur;
  const ProfilPage({super.key, required this.utilisateur});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeroWidget(texte: "Profil"),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(utilisateur.image.toString()),
            ),
            DetailsWidgets(titre: "id", donnee: utilisateur.id.toString()),
            dividerWidget(),
            DetailsWidgets(
              titre: "Username",
              donnee: utilisateur.username.toString(),
            ),
            dividerWidget(),
            DetailsWidgets(
              titre: "email",
              donnee: utilisateur.email.toString(),
            ),
            dividerWidget(),
            DetailsWidgets(
              titre: "Nom",
              donnee: utilisateur.firstName.toString(),
            ),
            dividerWidget(),
            DetailsWidgets(
              titre: "Sexe",
              donnee: utilisateur.gender.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
