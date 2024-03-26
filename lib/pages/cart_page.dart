import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/ingrediant.dart';
import 'package:recipe_app/pages/ingredients_page.dart';
import 'package:recipe_app/providers/cart_provider.dart';
import 'package:recipe_app/widgets/cart_container_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ingrediant> ingredints = context.watch<CartProvider>().ingredients;
    Set<Ingrediant> uniqueIngrediants = ingredints.toSet();
    List<Ingrediant> ingrediants = uniqueIngrediants.toList();

    if (ingrediants.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Cart",
            style: GoogleFonts.epilogue(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, IngredientPage.id);
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Press on the Icon above to Add The Ingredients",
              style: GoogleFonts.epilogue(
                fontSize: 30,
                color: kTitleColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
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
            "Cart",
            style: GoogleFonts.epilogue(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, IngredientPage.id);
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView.builder(
          itemCount: ingrediants.length,
          itemBuilder: (context, index) {
            return CartContainer(
              ingrediant: ingrediants[index],
            );
          },
        ),
      );
    }
  }
}
