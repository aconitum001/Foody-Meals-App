import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/models/category.dart';

import 'package:recipe_app/pages/categories_page.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.category,
    required this.email,
  });
  final Category category;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              CategoriesPage.id,
              arguments: {'category': category, 'email': email},
            ),
            child: SizedBox(
              width: 160,
              height: 160,
              child: Image.network(
                category.image,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              category.name,
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
