import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/snackbar.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/pages/sign_up_page.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LogInPage extends StatefulWidget {
  LogInPage({super.key});
  static String id = "logInPage";

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? email, password;

  GlobalKey<FormState> formstate = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.black,
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(color: Colors.black),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Foudiy",
            style: GoogleFonts.epilogue(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Form(
          key: formstate,
          child: ListView(
            children: [
              Container(
                child: Image.asset(
                  "assets/secound_one.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome Back",
                style: GoogleFonts.epilogue(
                  fontSize: 30,
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: "Email",
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                label: "Password",
                obscure: true,
                onChanged: (data) {
                  password = data;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Forget password?",
                    style: GoogleFonts.epilogue(
                      color: Color(0xff8A7361),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: CustomButtonLogIn(
                  text: "Log in",
                  onTap: () async {
                    if (formstate.currentState!.validate()) {
                      try {
                        isLoading = true;
                        setState(() {});
                        // ignore: unused_local_variable
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        isLoading = false;
                        showSnackBarr(
                            context,
                            'You have successfully logged in.',
                            'Welcome to Foudiy',
                            ContentType.success);
                        Navigator.pushNamed(context, Home.id, arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "invalid-email") {
                          showSnackBarr(
                              context,
                              "The email address is badly formatted.",
                              'Error',
                              ContentType.failure);
                        } else if (e.code == 'invalid-credential') {
                          showSnackBarr(
                              context,
                              "No user found for that email.",
                              'Error',
                              ContentType.failure);
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New User? ",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.epilogue(
                        color: kTitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
