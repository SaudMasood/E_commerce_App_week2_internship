import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:ecommerce_app/screens/signin_screen.dart';
import 'package:ecommerce_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            print("ScreenHight get: $screenHeight");
            print("screenWidth: $screenWidth");



            double imageWidth = screenWidth * 0.8;
            double imageHeight = screenHeight * 0.35;
            double buttonWidth = screenWidth * 0.70;
            double buttonHeight = 55;
            double spaceHeight = screenHeight * 0.5;
            double spaceWidth = screenWidth * 0.02;

            if (constraints.maxWidth < 400) {
              imageWidth = screenWidth * 0.95;
              imageHeight = screenHeight * 0.35;
              buttonWidth = screenWidth * 0.69;
              buttonHeight = 50;
              spaceHeight = screenHeight * 0.03;
              spaceWidth = screenWidth * 0.015;
            } else if (constraints.maxWidth < 600) {
              imageWidth = screenWidth * 0.80;
              imageHeight = screenHeight * 0.35;
              buttonWidth = screenWidth * 0.70;
              buttonHeight = 55;
              spaceHeight = screenHeight * 0.04;
              spaceWidth = screenWidth * 0.02;
            } else {
              imageWidth = 400;
              imageHeight = 350;
              buttonWidth = 350;
              buttonHeight = 60;
              spaceHeight = 30;
              spaceWidth = 10;
            }

            return Center(
              child: SingleChildScrollView(
                child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainScreen(),
                                    ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff12B8CF),
                                foregroundColor: Colors.white,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text("Skip"),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight*0.04),

                        Image.asset(
                          "assets/logo.png",
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.contain,
                        ),

                        SizedBox(height: spaceHeight),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Be yourself, everyone else\nis already taken.",
                            style: TextStyle(
                              color: const Color(0xff0A8FA3),                            fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight*0.05),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 28,
                              height: 5,
                              color:  Colors.grey,
                            ),
                            SizedBox(width: spaceWidth),
                            Container(
                              width: 28,
                              height: 5,
                              color: const Color(0xff12B8CF),
                            ),
                            SizedBox(width: spaceWidth),
                            Container(
                              width: 28,
                              height: 5,
                              color: Colors.grey,
                            ),
                            SizedBox(width: spaceWidth),
                            Container(
                              width: 28,
                              height: 5,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

              SizedBox(height: screenHeight*0.10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff12B8CF),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spaceHeight),
                ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}