import 'package:recipe_app/helper/api.dart';
import 'package:recipe_app/models/meal.dart';

class GetMealNameService {
  Future<Meal> getMealName({required String mealName}) async {
    Map<String, dynamic> data = await Api().get(
        url: "https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName");
    if (data["meals"] == null) {
      return Meal(
          id: "",
          name: "",
          category: "",
          instructions: "",
          image: "",
          ingeredients: [],
          measure: [],
          tags: "",
          area: "");
    } else {
      return Meal.fromjson(data);
    }
  }
}
