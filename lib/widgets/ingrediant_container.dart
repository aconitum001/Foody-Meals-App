import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/snackbar.dart';
import 'package:recipe_app/models/ingrediant.dart';
import 'package:recipe_app/providers/cart_provider.dart';

class IngrediantContainer extends StatelessWidget {
  const IngrediantContainer({
    super.key,
    required this.ingredients,
    required this.ingredientNames,
    required this.controller,
    required this.index,
  });
  final int index;
  final List<Ingrediant>? ingredients;
  final List<String> ingredientNames;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 12,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 140,
        child: Row(
          children: [
            Image.network(
              ingredients![index].image,
              height: 110,
              width: 110,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ingredients![index].IngrediantName,
                    style: GoogleFonts.epilogue(
                      fontSize: 16,
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Quantity",
                    style: GoogleFonts.epilogue(
                      fontSize: 11,
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 80,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      onSubmitted: (data) {
                        ingredients![index].quantity = data;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.clear();

                    context.read<CartProvider>().addIngredient(
                          ingredient: ingredients![index],
                        );
                    showSnackBarr(context, 'Ingredient Added Successfully!',
                        'Cart Update', ContentType.success);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: const Color(0xFFF2EDE8),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: kTitleColor,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
