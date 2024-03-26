import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: GoogleFonts.epilogue(
          fontSize: 14,
          color: kTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xFFF2EDE8),
    ),
  );
}

void showSnackBarr(
    BuildContext context, String message, String title, ContentType type) {
  final snackBar = SnackBar(
    clipBehavior: Clip.none,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: type,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
