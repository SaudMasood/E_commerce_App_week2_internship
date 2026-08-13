import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() =>
      _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState
    extends State<PaymentSuccessScreen> {

  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

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

      actions: [
        const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.cyan,
        ),

        const SizedBox(width: 15),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          },

          child: const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(
              "assets/profile.png",
            ),
          ),
        ),

        const SizedBox(width: 10),
      ],

      bodyPadding: EdgeInsets.zero,

      body: Center(
        child: Column(
          children: [

            SizedBox(
              height: screenheight * 0.12,
            ),

            // SUCCESS CIRCLE
            Container(
              height: 105,
              width: 105,

              decoration: BoxDecoration(
                color: Colors.cyan.shade300,
                shape: BoxShape.circle,
              ),

              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.03,
            ),

            // SUCCESS MESSAGE
            const Text(
              "Your payment was\nsuccessfully processed",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),

            SizedBox(
              height: screenheight * 0.05,
            ),

            // YOUR ORDERS BUTTON
            GestureDetector(
              onTap: () {
                // Later navigate to OrdersScreen
              },

              child: Container(
                height: 45,
                width: screenwidth * 0.35,

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                  BorderRadius.circular(25),
                ),

                child: const Center(
                  child: Text(
                    "Your Orders",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}