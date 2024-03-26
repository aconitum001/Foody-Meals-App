import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/snackbar.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String id = "sign_in_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email, password, number, username;
  var users = FirebaseFirestore.instance.collection("users");
  GlobalKey<FormState> formstate = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: Colors.black,
      progressIndicator: CircularProgressIndicator(color: Colors.black),
      child: Scaffold(
        body: Form(
          key: formstate,
          child: ListView(
            children: [
              Container(
                child: Image.asset(
                  "assets/third_one.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Sign In",
                    style: GoogleFonts.epilogue(
                      fontSize: 20,
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                label: "Username",
                onChanged: (data) {
                  username = data;
                },
              ),
              const SizedBox(
                height: 12,
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
                label: "Phone Number",
                type: TextInputType.phone,
                onChanged: (data) {
                  number = data;
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomButtonLogIn(
                  text: "Sign In",
                  onTap: () async {
                    if (formstate.currentState!.validate()) {
                      try {
                        isLoading = true;
                        setState(() {});
                        // ignore: unused_local_variable
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        print("========================");
                        users.add({
                          'user': username,
                          'favorites': [],
                          'id': email,
                          'phone': number,
                        });
                        showSnackBarr(
                            context,
                            'You have successfully created an account.',
                            'Welcome to Foudiy',
                            ContentType.success);
                        isLoading = false;
                        setState(() {});
                        Navigator.pushNamed(context, Home.id, arguments: email);
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                        if (e.code == "invalid-email") {
                          showSnackBarr(context, 'Invalid Email', 'Error',
                              ContentType.failure);
                        }
                        if (e.code == 'weak-password') {
                          showSnackBarr(
                              context,
                              'The password provided is too weak.',
                              'Error',
                              ContentType.failure);
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBarr(
                              context,
                              'The account already exists for that email.',
                              'Error',
                              ContentType.failure);
                        }
                      } catch (e) {
                        showSnackBarr(
                            context,
                            "There is an error. Please try again",
                            'Error',
                            ContentType.failure);
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
                    "Already Have an Account? ",
                    style: GoogleFonts.epilogue(
                      color: kTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Log in",
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
