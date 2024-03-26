import 'package:recipe_app/helper/api.dart';

class GetAllIngredients {
  Future<List<String>> getIngredient() async {
    var data = await (Api()
        .get(url: "https://www.themealdb.com/api/json/v1/1/list.php?i=list"));
    List<String> ingredients = [];
    print("============================data:$data");

    for (int i = 0; i < data["meals"].length; i++) {
      ingredients.add(data["meals"][i]["strIngredient"]);
    }
    return ingredients;
  }
}
