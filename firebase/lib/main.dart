import 'package:firebase/Providers/auth_service_provider.dart';
import 'package:firebase/Providers/deconnexion_service_provider.dart';
import 'package:firebase/Providers/inscription_provider.dart';
import 'package:firebase/Services/Authentification%20Services/deconnexion_service.dart';
import 'package:firebase/views/Authentification%20pages/inscription_page.dart';
import 'package:firebase/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InscriptionProvider()),
        ChangeNotifierProvider(create: (context) => AuthServiceProvider()),
        ChangeNotifierProvider(
          create: (context) => DeconnexionServiceProvider(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
