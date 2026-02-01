import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroWidget extends StatelessWidget {
  final String texte;
  const HeroWidget({super.key, required this.texte});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,

      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: FittedBox(
              child: Text(
                texte,
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  letterSpacing: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
