import 'package:firebase/Providers/auth_service_provider.dart';
import 'package:firebase/views/Authentification%20pages/connexion_page.dart';
import 'package:firebase/views/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (context, value, child) => StreamBuilder(
        stream: value.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ProfilPage();
          } else {
            return ConnexionPage();
          }
        },
      ),
    );
  }
}
