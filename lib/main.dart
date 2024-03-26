import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/helper/splashScreen.dart';
import 'package:recipe_app/pages/ingredients_page.dart';
import 'package:recipe_app/pages/categories_page.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/pages/log_in_page.dart';
import 'package:recipe_app/pages/meal_deatails_page.dart';
import 'package:recipe_app/pages/get_started_page.dart';
import 'package:recipe_app/pages/sign_up_page.dart';
import 'package:recipe_app/providers/cart_provider.dart';
import 'package:recipe_app/providers/favorite_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignUpPage.id: (context) => SignUpPage(),
          LogInPage.id: (context) => LogInPage(),
          GetStartedPage.id: (context) => const GetStartedPage(),
          Home.id: (context) => const Home(),
          CategoriesPage.id: (context) => const CategoriesPage(),
          MealDetailsPage.id: (context) => MealDetailsPage(),
          IngredientPage.id: (context) => IngredientPage(),
          SplashScreen.id: (context) => const SplashScreen(),
        },
        title: "Recipe App",
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
