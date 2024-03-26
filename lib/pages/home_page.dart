import 'package:flutter/material.dart';

import 'package:recipe_app/pages/cart_page.dart';
import 'package:recipe_app/pages/favorite_page.dart';

import 'package:recipe_app/widgets/home_page_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = 'home Page';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    final pages = [
      HomePage(email: email),
      CartPage(),
      FavoritePage(
        email: email,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            iconTheme: MaterialStateProperty.all(
              const IconThemeData(
                color: Colors.black,
              ),
            ),
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black))),
        child: NavigationBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFF2EDE8),
          height: 60,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              selectedIcon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              selectedIcon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.star_outline),
              selectedIcon: Icon(
                Icons.star,
              ),
              label: 'Favorite',
            ),
          ],
          selectedIndex: pageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
