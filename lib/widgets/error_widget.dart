import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Center(
            child: Text(
              "OOPS!",
              style: TextStyle(
                color: Color(0xffF27927),
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "We can't seem to find the Meal you're looking for.",
            style: TextStyle(
              color: Color(0xff04364E),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 50,
                  color: const Color(0xffF27927),
                  child: const Center(
                    child: Text(
                      "Back to Home Page",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Image.asset(
              "assets/Screenshot 2024-02-15 192059.png",
              height: 450,
            ),
          )
        ],
      ),
    );
  }
}
