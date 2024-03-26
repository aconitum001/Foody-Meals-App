import 'package:recipe_app/services/get_all_categories.dart';
import 'package:recipe_app/services/get_random_meal.dart';

class GetHomePage {
  Future<List> getHomePage() async {
    var result = [];

    var data1 = await GetCategoryService().getCategory();
    var data2 = await GetRandomMealService().getNRandomMeal(n: 10);

    result.addAll([data1, data2]);

    return result;
  }
}
