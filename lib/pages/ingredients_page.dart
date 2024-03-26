import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/ingrediant.dart';
import 'package:recipe_app/services/get_ingrediant.dart';
import 'package:recipe_app/widgets/ingrediant_container.dart';
import 'package:recipe_app/widgets/loading_widget.dart';

// ignore: must_be_immutable
class IngredientPage extends StatelessWidget {
  IngredientPage({super.key});
  static String id = 'Ingredient Page';
  final List<TextEditingController> _controllers = [];
  String quantity = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Ingredients",
          style: GoogleFonts.epilogue(
            color: kTitleColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: GetIngrediant().getAllIngrediants(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Ingrediant>? ingredients = snapshot.data;
              _controllers.clear();
              return SizedBox(
                child: ListView.builder(
                  itemCount: ingredients!.length,
                  itemBuilder: (context, index) {
                    List<String> ingredientNames =
                        ingredients[index].IngrediantName.split(" ");
                    TextEditingController controller = TextEditingController(
                        text: ingredients[index].quantity);
                    _controllers.add(controller);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: IngrediantContainer(
                          index: index,
                          ingredients: ingredients,
                          ingredientNames: ingredientNames,
                          controller: controller),
                    );
                  },
                ),
              );
            } else {
              return LoadingWidget();
            }
          }),
        ),
      ),
    );
  }
}
