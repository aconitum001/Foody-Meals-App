import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/providers/favorite_provider.dart';
import 'package:recipe_app/services/get_meal_byname.dart';
import 'package:recipe_app/widgets/error_widget.dart';
import 'package:recipe_app/widgets/ingredient_checkbox.dart';
import 'package:recipe_app/widgets/loading_widget.dart';
import 'package:recipe_app/widgets/tags_container.dart';

// ignore: must_be_immutable
class MealDetailsPage extends StatelessWidget {
  static String id = 'Deatailed Meal page';

  bool? isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String mealName = data["meal"];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: FutureBuilder(
        future: GetMealNameService().getMealName(mealName: mealName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Meal meal = snapshot.data!;
            List<String> tags = meal.tags.split(",");
            List<dynamic> favoriteMeals =
                context.watch<FavoriteProvider>().favoriteMeals;
            for (int i = 0; i < favoriteMeals.length; i++) {
              if (favoriteMeals[i].id == meal.id) {
                isFavorite = true;
                break;
              }
            }
            if (meal.id == "") {
              return const CustomErrorWidget();
            }
            List<String> ingredients = meal.ingeredients;
            List<String> measurements = meal.measure;
            List<String> details = [];
            if (ingredients.length == measurements.length) {
              for (int i = 0; i < meal.ingeredients.length; i++) {
                details.add(" ${measurements[i]} ${ingredients[i]}");
              }
            } else {
              details = ingredients;
            }
            return ListView(
              children: [
                SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: Image.network(
                    meal.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    meal.name,
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => TagsContainer(tag: tags[i]),
                      itemCount: tags.length,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Ingredients",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    for (int i = 0; i < details.length; i++)
                      IngredientCheckbox(detail: details[i]),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Instructions",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    meal.instructions,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                FavoriteButton(
                  meal: meal,
                  isFavorite: isFavorite!,
                )
              ],
            );
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  FavoriteButton({
    required this.meal,
    required this.isFavorite,
  });

  final Meal meal;
  final bool isFavorite;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, right: 12, left: 12),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });
          if (isFavorite) {
            context.read<FavoriteProvider>().addFavoriteMeal(meal: widget.meal);
          } else {
            context
                .read<FavoriteProvider>()
                .deleteFavoriteMeal(meal: widget.meal);
          }
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xffF2EDE8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isFavorite ? Icon(Icons.star) : Icon(Icons.star_outline),
              const SizedBox(width: 10),
              Text(
                isFavorite ? "Remove from favorite" : "Add to favorite",
                style: GoogleFonts.epilogue(
                  color: kTitleColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
