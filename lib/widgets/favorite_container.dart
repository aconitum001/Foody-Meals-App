import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/providers/favorite_provider.dart';

class FavoriteContainer extends StatelessWidget {
  const FavoriteContainer({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6),
      child: ListTile(
        title: Text(
          meal.name,
          style: GoogleFonts.epilogue(
            color: kTitleColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(meal.image),
        ),
        subtitle: Text(
          meal.tags,
          style: GoogleFonts.epilogue(
            color: kTextColor,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<FavoriteProvider>().deleteFavoriteMeal(meal: meal);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
