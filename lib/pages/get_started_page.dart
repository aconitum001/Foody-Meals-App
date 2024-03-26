import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/pages/log_in_page.dart';
import 'package:recipe_app/pages/sign_up_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  static String id = "getstartedPage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/first_one.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Welcome to Foudiy",
              style: GoogleFonts.epilogue(
                fontSize: 30,
                color: kTitleColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Discover delicious recipes tailored to your taste buds and dietary preferences.",
                style: GoogleFonts.epilogue(
                  fontSize: 16,
                  color: kTitleColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "Get Started",
                    color: Color(0xffF5F2F0),
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                  ),
                  CustomButton(
                    text: "Log in",
                    color: Color(0xffF57D26),
                    onTap: () {
                      Navigator.pushNamed(context, LogInPage.id);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: GoogleFonts.epilogue(
          fontSize: 15,
          color: kTitleColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
