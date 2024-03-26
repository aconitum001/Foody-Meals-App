import 'package:recipe_app/helper/api.dart';
import 'package:recipe_app/models/ingrediant.dart';

class GetIngrediant {
  Future<List<Ingrediant>> getAllIngrediants() async {
    Map<String, dynamic> data = await Api()
        .get(url: "https://www.themealdb.com/api/json/v1/1/list.php?i=list");

    List<Ingrediant> ingredients = [];

    for (int i = 0; i < data["meals"].length; i++) {
      ingredients.add(Ingrediant.fromjson(data["meals"][i]));
    }

    return ingredients;
  }
}
