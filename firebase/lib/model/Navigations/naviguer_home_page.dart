import 'dart:io';

import 'package:firebase/model/User/user.dart';
import 'package:firebase/views/profil_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void naviguerHomePage(BuildContext context, Utilisateur utilisateur) {
  if (Platform.isAndroid) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ProfilPage(utilisateur: utilisateur),
      ),
    );
  }

  if (Platform.isIOS) {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (context) => ProfilPage(utilisateur: utilisateur),
      ),
    );
  }
}
