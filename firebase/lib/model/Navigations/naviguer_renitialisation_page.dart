import 'dart:io';
import 'package:firebase/views/Authentification%20pages/renitialisation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void naviguerRenitialisationPage(BuildContext context) {
  if (Platform.isAndroid) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => RenitialisationPage()));
  }

  if (Platform.isIOS) {
    Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => RenitialisationPage()));
  }
}
