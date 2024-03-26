import 'package:recipe_app/helper/api.dart';
import 'package:recipe_app/models/category.dart';

class GetCategoryService {
  Future<List<Category>> getCategory() async {
    Map<String, dynamic> data = await Api()
        .get(url: "https://www.themealdb.com/api/json/v1/1/categories.php");

    List<Category> categories = [];
    for (int i = 0; i < data["categories"].length; i++) {
      categories.add(Category.fromJson(data["categories"][i]));
    }
    return categories;
  }
}
