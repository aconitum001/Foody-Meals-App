import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/pages/meal_deatails_page.dart';

class CategoryMealWidget extends StatelessWidget {
  const CategoryMealWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, MealDetailsPage.id,
              arguments: title),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                15,
              ),
              child: Image.network(
                image,
                width: 180,
                height: 180,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: GoogleFonts.epilogue(
            color: kTitleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
