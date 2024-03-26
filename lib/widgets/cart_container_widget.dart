import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/ingrediant.dart';
import 'package:recipe_app/providers/cart_provider.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.ingrediant,
  });
  final Ingrediant ingrediant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
      child: ListTile(
        leading: Image.network(ingrediant.image),
        title: Text(
          ingrediant.IngrediantName,
          style: GoogleFonts.epilogue(
            color: kTitleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: ingrediant.quantity == ""
            ? null
            : Text(
                "Qty: ${ingrediant.quantity}",
                style: GoogleFonts.epilogue(
                  color: kTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
        trailing: IconButton(
          onPressed: () {
            context
                .read<CartProvider>()
                .deleteIngredient(ingredient: ingrediant);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
