import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBouton extends StatelessWidget {
  final String texte;
  final VoidCallback action;
  final bool chargement;
  const CustomBouton({
    super.key,
    required this.texte,
    required this.action,
    required this.chargement,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: chargement ? null : action,
        child: chargement
            ? Text(
                "Chargement ...",
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              )
            : Text(
                texte,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
