import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';

class IngredientCheckbox extends StatefulWidget {
  final String detail;

  IngredientCheckbox({required this.detail});

  @override
  _IngredientCheckboxState createState() => _IngredientCheckboxState();
}

class _IngredientCheckboxState extends State<IngredientCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.detail,
        style: GoogleFonts.epilogue(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: kTitleColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      value: isChecked,
      activeColor: const Color(0xffD6BDAD),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
    );
  }
}
