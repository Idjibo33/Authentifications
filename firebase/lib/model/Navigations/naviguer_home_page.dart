import 'dart:io';
import 'package:firebase/views/profil_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void naviguerHomePage(BuildContext context) {
  if (Platform.isAndroid) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => ProfilPage()));
  }

  if (Platform.isIOS) {
    Navigator.of(
      context,
    ).pushReplacement(CupertinoPageRoute(builder: (context) => ProfilPage()));
  }
}
