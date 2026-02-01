import 'dart:io';

import 'package:firebase/views/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void naviguerSplashPage(BuildContext context) {
  if (Platform.isAndroid) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashPage()),
    );
  }
  if (Platform.isIOS) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => SplashPage()),
    );
  }
}
