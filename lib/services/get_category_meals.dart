import 'package:recipe_app/helper/api.dart';

import 'package:recipe_app/models/category_meal.dart';

class GetCategoryMeal {
  Future<List<CategoryMeal>> getCategoryMeal({required String catName}) async {
    Map<String, dynamic> data = await Api().get(
        url: "https://www.themealdb.com/api/json/v1/1/filter.php?c=$catName");
    List<CategoryMeal> meals = [];

    for (int i = 0; i < data["meals"].length; i++) {
      meals.add(CategoryMeal.fromjson(data["meals"][i]));
    }

    return meals;
  }
}
