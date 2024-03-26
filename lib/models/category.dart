class Category {
  String id;
  String name;
  String image;
  String desc;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
  });

  factory Category.fromJson(jsonData) {
    return Category(
      id: jsonData["idCategory"],
      name: jsonData["strCategory"],
      image: jsonData["strCategoryThumb"],
      desc: jsonData["strCategoryDescription"],
    );
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, image: $image, desc: $desc}';
  }
}
