import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';

class FavoriteProvider extends ChangeNotifier {
  List<dynamic> favoriteMeals = [];

  void addFavoriteMeal({required Meal meal}) {
    favoriteMeals.add(meal);
    notifyListeners();
  }

  void deleteFavoriteMeal({required Meal meal}) {
    favoriteMeals.remove(meal);
    notifyListeners();
  }
}
