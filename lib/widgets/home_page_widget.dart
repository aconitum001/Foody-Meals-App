import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/services/get_home_page.dart';
import 'package:recipe_app/widgets/category_view.dart';
import 'package:recipe_app/widgets/custom_searchbar.dart';
import 'package:recipe_app/widgets/loading_widget.dart';
import 'package:recipe_app/widgets/random_meal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.email});
  final String email;
  static String id = "Home page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetHomePage().getHomePage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(
                  flex: 3,
                ),
                Image.asset(
                  "assets/no-internet.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "No connection",
                  style: GoogleFonts.epilogue(
                    color: kTitleColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "No internet connection found.check your connection or try again.",
                  style: GoogleFonts.epilogue(
                    color: kTitleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Home.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF2EDE8),
                    ),
                    child: Text(
                      "TRY AGAIN",
                      style: GoogleFonts.epilogue(
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          List<dynamic> categories = snapshot.data![0];
          List<dynamic> meals = snapshot.data![1];
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                "Foudiy",
                style: GoogleFonts.epilogue(
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/icon.png',
                            ) // Add your image path here
                            ),
                        Text(
                          "Foudiy",
                          style: GoogleFonts.epilogue(
                            color: kTitleColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(
                      "Foudiy@gmail.com",
                      style: GoogleFonts.epilogue(
                        color: kTitleColor,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      "+216 99 542 231",
                      style: GoogleFonts.epilogue(
                        color: kTitleColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                clipBehavior: Clip.none,
                children: [
                  const CustomSearchBar(),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Trending categories",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => CategoryView(
                        category: categories[index],
                        email: widget.email,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "New recipes",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        Meal meal = meals[index];
                        if (meal.tags == "") {
                          meal.tags = "Delicious,Tasty,Flavorful";
                        }
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            bottom: 20,
                            right: 24,
                            top: 10,
                          ),
                          child: RandomMealWidget(
                            email: widget.email,
                            name: meal.name,
                            tags: meal.tags,
                            image: meal.image,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text("There is no  Data"),
          );
        }
      },
    );
  }
}
