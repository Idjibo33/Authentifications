import 'dart:io';
import 'package:firebase/views/Authentification%20pages/inscription_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void naviguerInscriptionPage(BuildContext context) {
  if (Platform.isAndroid) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InscriptionPage()),
    );
  }
  if (Platform.isIOS) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => InscriptionPage()),
    );
  }
}
