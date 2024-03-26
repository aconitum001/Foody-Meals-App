import 'package:flutter/material.dart';
import 'package:recipe_app/models/ingrediant.dart';

class CartProvider extends ChangeNotifier {
  List<Ingrediant> ingredients = [];

  void addIngredient({required Ingrediant ingredient}) {
    ingredients.add(ingredient);
    notifyListeners();
  }

  void deleteIngredient({required Ingrediant ingredient}) {
    ingredients.remove(ingredient);
    notifyListeners();
  }
}
