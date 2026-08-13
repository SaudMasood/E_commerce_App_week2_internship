import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:ecommerce_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final confirmPass = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.cyan,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -15,
                      bottom: 100,
                      child: Container(
                        width: screenWidth * 0.75,
                        height: screenHeight * 0.75,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: screenWidth * 0.90,
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),

                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xff12B8CF),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),

                                TextFormField(
                                  controller: email,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your email";
                                    }

                                    if (!value.contains("@")) {
                                      return "Enter a valid email";
                                    }

                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Email Address",
                                    hintText: "Enter your email",
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Color(0xff12B8CF),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xff12B8CF),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),

                                TextFormField(
                                  controller: pass,
                                  obscureText: !showPassword,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    }

                                    if (value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: Color(0xff12B8CF),
                                    ),
                                    hintText: "Enter your password",
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xff12B8CF),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xff12B8CF),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),

                                TextFormField(
                                  controller: confirmPass,
                                  obscureText: !showConfirmPassword,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please confirm your password";
                                    }

                                    if (value != pass.text) {
                                      return "Passwords do not match";
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                      color: Color(0xff12B8CF),
                                    ),
                                    hintText: "Enter your password again",
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xff12B8CF),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        showConfirmPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xff12B8CF),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showConfirmPassword =
                                          !showConfirmPassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),

                                SizedBox(
                                  width: screenWidth * 0.40,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        print("Sign Up");
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const MainScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      const Color(0xff12B8CF),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text("Sign Up"),
                                  ),
                                ),

                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),

                                Text(
                                  "Or using social media",
                                  style: TextStyle(
                                    color: Color(0xff12B8CF),
                                  ),
                                ),

                                SizedBox(height: 8),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.blue,
                                        child: FaIcon(
                                          FontAwesomeIcons.facebookF,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {},
                                      icon: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.lightBlue,
                                        child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {},
                                      icon: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.redAccent,
                                        child: FaIcon(
                                          FontAwesomeIcons.googlePlusG,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {},
                                      icon: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.blue,
                                        child: FaIcon(
                                          FontAwesomeIcons.linkedinIn,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: screenHeight * 0.02,
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}