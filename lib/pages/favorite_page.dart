import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/providers/favorite_provider.dart';
import 'package:recipe_app/widgets/favorite_container.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    super.key,
    required this.email,
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    print(email);
    List<dynamic> meals = context.watch<FavoriteProvider>().favoriteMeals;
    if (meals.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Favorites",
            style: GoogleFonts.epilogue(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "There is no Favorite Meals",
            style: GoogleFonts.epilogue(
              fontSize: 30,
              color: kTitleColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Favorites",
            style: GoogleFonts.epilogue(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            for (int i = 0; i < meals.length; i++)
              FavoriteContainer(meal: meals[i])
          ],
        ),
      );
    }
  }
}
