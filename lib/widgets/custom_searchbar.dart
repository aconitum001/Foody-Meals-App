import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/pages/meal_deatails_page.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (data) {
        Navigator.pushNamed(context, MealDetailsPage.id,
            arguments: {'meal': data, 'email': ''});
        controller.clear(); // Clear the text field after submitting
      },
      style: const TextStyle(color: kTextColor),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        fillColor: const Color(0xFFF2EDE8),
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: kTextColor,
        ),
        hintText: "Find a recipe",
        hintStyle: const TextStyle(color: kTextColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
