class Ingrediant {
  String IngrediantName;
  String image;
  String quantity;

  Ingrediant({
    required this.IngrediantName,
    required this.image,
    required this.quantity,
  });

  factory Ingrediant.fromjson(jsonData) {
    return Ingrediant(
      IngrediantName: jsonData["strIngredient"],
      image:
          "https://www.themealdb.com/images/ingredients/${jsonData["strIngredient"]}.png",
      quantity: "",
    );
  }

  @override
  String toString() {
    return 'Ingrediant{IngrediantName: $IngrediantName, image: $image, quantity: $quantity}';
  }
}
