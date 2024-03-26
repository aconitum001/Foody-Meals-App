import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.obscure = false,
    this.type = TextInputType.name,
  });
  bool obscure;
  Function(String)? onChanged;
  String? label;
  TextInputType type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          }
        },
        keyboardType: type,
        obscureText: obscure,
        onChanged: onChanged,
        style: TextStyle(color: Color(0xff8A7361)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          filled: true,
          fillColor: Color(0xffF5F2F0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          label: Text(
            label!,
            style: GoogleFonts.epilogue(
              fontSize: 16,
              color: Color(0xff8A7361),
            ),
          ),
        ),
      ),
    );
  }
}
