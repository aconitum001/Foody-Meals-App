class Meal {
  String id;
  String name;
  String category;
  String instructions;
  String image;
  List<String> ingeredients;
  List<String> measure;
  String tags;
  String area;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.image,
    required this.ingeredients,
    required this.measure,
    required this.tags,
    required this.area,
  });

  factory Meal.fromjson(jsonData) {
    List<String> ingeredient = [];
    List<String> measurment = [];
    Map<String, dynamic> data = jsonData["meals"][0];
    for (int i = 1; i <= 20; i++) {
      if (data["strIngredient$i"] == null || data["strIngredient$i"] == "") {
        break;
      } else {
        ingeredient.add(data["strIngredient$i"]);
      }
    }
    for (int i = 1; i <= 20; i++) {
      if (data["strMeasure$i"] == null || data["strMeasure$i"] == "") {
        break;
      } else {
        measurment.add(data["strMeasure$i"]);
      }
    }
    return Meal(
      id: data["idMeal"],
      name: data["strMeal"],
      category: data["strCategory"],
      instructions: data["strInstructions"],
      image: data["strMealThumb"],
      ingeredients: ingeredient,
      measure: measurment,
      tags: data["strTags"] ?? "Delicious,Flavorful,Yummy",
      area: data["strArea"],
    );
  }
  @override
  String toString() {
    return 'Meal{id: $id, name: $name, category: $category, instructions: $instructions, image: $image, ingredients: $ingeredients, measurements: $measure, tags: $tags, area: $area}';
  }
}
