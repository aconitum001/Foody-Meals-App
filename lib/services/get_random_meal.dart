import 'package:recipe_app/helper/api.dart';
import 'package:recipe_app/models/meal.dart';

class GetRandomMealService {
  Future<Meal> getRandomMeal() async {
    Map<String, dynamic> data = await Api()
        .get(url: "https://www.themealdb.com/api/json/v1/1/random.php");
    return Meal.fromjson(data);
  }

  Future<List<Meal>> getNRandomMeal({required int n}) async {
    List<Meal> meals = [];
    for (int i = 0; i < n; i++) {
      Meal meal = await getRandomMeal();
      meals.add(meal);
    }

    return meals;
  }
}
