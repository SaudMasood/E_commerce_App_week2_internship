import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:ecommerce_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  String selectedPayment = "Visa";

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Checkout",
      titleColor: Colors.blueGrey,

      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),

      actions: const [
        Icon(
          Icons.shopping_cart_outlined,
          color: Colors.cyan,
        ),

        SizedBox(width: 15),

        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage(
            "assets/profile.png",
          ),
        ),

        SizedBox(width: 10),
      ],

      body: ListView(
          children: [

            // PAYMENT MODE
            Row(
              children: [

                Icon(
                  Icons.payment_outlined,
                  color: Colors.blueGrey,
                  size: 25,
                ),

                SizedBox(
                  width: screenwidth * 0.05,
                ),

                const Text(
                  "Payment Mode",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.only(
                left: screenwidth * 0.14,
              ),

              child: const Text(
                "Select your preferred payment mode",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.04,
            ),

            // VISA CARD
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPayment = "Visa";
                });
              },

              child: Container(
                height: 170,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(
                    color: selectedPayment == "Visa"
                        ? Colors.cyan
                        : Colors.transparent,
                    width: 2,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "VISA",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "CARD NUMBER",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 3),

                    const Text(
                      "8154 3265 0045 1582",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [

                        const Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              "EXPIRY DATE",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey,
                              ),
                            ),

                            Text(
                              "07/21",
                              style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: screenwidth * 0.25,
                        ),

                        const Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              "CVV",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey,
                              ),
                            ),

                            Text(
                              "007",
                              style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.04,
            ),

            // OR CHECKOUT
            const Center(
              child: Text(
                "Or Checkout With",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // PAYPAL
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPayment = "PayPal";
                });
              },

              child: Container(
                height: 45,

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),

                  border: Border.all(
                    color: selectedPayment == "PayPal"
                        ? Colors.cyan
                        : Colors.transparent,
                  ),
                ),

                child: const Center(
                  child: Text(
                    "PayPal",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPayment = "Apple Pay";
                });
              },

              child: Container(
                height: 45,

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),

                  border: Border.all(
                    color: selectedPayment == "Apple Pay"
                        ? Colors.cyan
                        : Colors.transparent,
                  ),
                ),

                child: const Center(
                  child: Text(
                    "Pay",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.03,
            ),

            // CONFIRM PAYMENT
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentSuccessScreen(),
                    ));
                        print(
                  "Payment Method: $selectedPayment",
                );

              },

              child: Container(
                height: 55,

                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius:
                  BorderRadius.circular(30),
                ),

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,

                  children: [

                    const Text(
                      "Confirm Payment",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "\$55.36",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}