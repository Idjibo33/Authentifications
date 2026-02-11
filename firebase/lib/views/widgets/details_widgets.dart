import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsWidgets extends StatelessWidget {
  final String titre;
  final String donnee;
  const DetailsWidgets({super.key, required this.titre, required this.donnee});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            titre,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(donnee, style: GoogleFonts.roboto(fontSize: 16)),
        ],
      ),
    );
  }
}
