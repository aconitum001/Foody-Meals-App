import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/category_meal.dart';
import 'package:recipe_app/pages/meal_deatails_page.dart';
import 'package:recipe_app/services/get_category_meals.dart';
import 'package:recipe_app/widgets/custom_container.dart';
import 'package:recipe_app/widgets/loading_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  static String id = 'Categories Page';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Category category = data["category"];
    String email = data["email"];

    return FutureBuilder(
      future: GetCategoryMeal().getCategoryMeal(catName: category.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: LoadingWidget(),
          );
        } else if (snapshot.hasData) {
          List<CategoryMeal>? meals = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              title: Text(
                category.name,
                style: GoogleFonts.epilogue(
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    category.desc,
                    style: GoogleFonts.epilogue(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kTitleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Choose a recipe",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: meals!.length,
                    itemBuilder: (context, index) =>
                        CatMealWidget(meal: meals[index], email: email),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomContainer(
                    backgroundColor: Color(0xffED732B),
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    text: 'View recipe',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text("There is no Data"),
          );
        }
      },
    );
  }
}

class CatMealWidget extends StatelessWidget {
  const CatMealWidget({
    super.key,
    required this.meal,
    required this.email,
  });
  final String email;
  final CategoryMeal meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(meal.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MealDetailsPage.id,
                            arguments: {'meal': meal.name, 'email': email});
                      },
                      icon: Icon(
                        Icons.article,
                        color: kTitleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: -40,
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 40),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                meal.name.length < 30 ? meal.name : meal.name.substring(0, 30),
                style: GoogleFonts.epilogue(
                  color: kTitleColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
