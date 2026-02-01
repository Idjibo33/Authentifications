import 'dart:io';
import 'package:firebase/views/Authentification%20pages/connexion_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void naviguerConnexionPage(BuildContext context) {
  if (Platform.isAndroid) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConnexionPage()),
    );
  }
  if (Platform.isIOS) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => ConnexionPage()),
    );
  }
}
