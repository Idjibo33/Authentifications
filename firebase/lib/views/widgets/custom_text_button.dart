import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String texte;
  final bool chargement;
  final VoidCallback action;
  const CustomTextButton({
    super.key,
    required this.texte,
    required this.chargement,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: chargement ? null : action,
      child: chargement
          ? Text(
              "Patientez un instant",
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            )
          : Text(
              "Continuer en tant qu'invité",
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
    );
  }
}
