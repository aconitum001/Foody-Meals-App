class CategoryMeal {
  String id;
  String image;
  String name;

  CategoryMeal({
    required this.id,
    required this.image,
    required this.name,
  });

  factory CategoryMeal.fromjson(jsonData) {
    return CategoryMeal(
      id: jsonData["idMeal"],
      image: jsonData["strMealThumb"],
      name: jsonData["strMeal"],
    );
  }
}
