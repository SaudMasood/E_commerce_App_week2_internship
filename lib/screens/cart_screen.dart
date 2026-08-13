import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:ecommerce_app/screens/checkout_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final List<Map<String, dynamic>> cartProducts = [
    {
      "image":
      "https://images.unsplash.com/photo-1593487568720-92097fb74f30",
      "name": "Plant Vases",
      "price": 63.98,
      "quantity": 1,
    },
    {
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "name": "Maxi Dress For Women Summer",
      "price": 36.12,
      "quantity": 1,
    },
    {
      "image":
      "https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6",
      "name": "Foldable Silicone Colander Fruit ...",
      "price": 63.98,
      "quantity": 1,
    },
  ];

  void increaseQuantity(int index) {
    setState(() {
      cartProducts[index]["quantity"]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartProducts[index]["quantity"] > 1) {
        cartProducts[index]["quantity"]--;
      }
    });
  }

  double get subtotal {
    double total = 0;

    for (var product in cartProducts) {
      total += product["price"] * product["quantity"];
    }

    return total;
  }

  double get tax {
    return subtotal * 0.20;
  }

  double get total {
    return subtotal + tax;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Cart",

      body: ListView(
          children: [

            // SHOPPING CART TITLE
            Row(
              children: [

                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.blueGrey,
                  size: 25,
                ),

                SizedBox(
                  width: screenwidth * 0.05,
                ),

                const Text(
                  "Shopping Cart",
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
                "Verify your quantity and click checkout",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.03,
            ),

            // CART PRODUCTS
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: cartProducts.length,

              itemBuilder: (context, index) {

                final product = cartProducts[index];

                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 8,
                  ),

                  padding: const EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Row(
                    children: [

                      // PRODUCT IMAGE
                      Container(
                        height: 80,
                        width: 70,

                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(8),
                        ),

                        child: Image.network(
                          product["image"],
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // PRODUCT INFORMATION
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(
                              product["name"],
                              maxLines: 2,
                              overflow:
                              TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "\$${product["price"]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // QUANTITY BUTTONS
                      Column(
                        children: [

                          IconButton(
                            onPressed: () {
                              increaseQuantity(index);
                            },

                            padding: EdgeInsets.zero,

                            constraints:
                            const BoxConstraints(),

                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.blueGrey,
                              size: 25,
                            ),
                          ),

                          Text(
                            "${product["quantity"]}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              decreaseQuantity(index);
                            },

                            padding: EdgeInsets.zero,

                            constraints:
                            const BoxConstraints(),

                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.blueGrey,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(
              height: screenheight * 0.02,
            ),

            // DIVIDER
            const Divider(),

            const SizedBox(height: 10),

            // SUBTOTAL
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),

                Text(
                  "\$${subtotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // TAX
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  "TAX (20%)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),

                Text(
                  "\$${tax.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // CHECKOUT BUTTON
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutScreen(),
                  ),
                );
              },

              child: Container(
                height: 55,

                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                    const Text(
                      "Checkout",
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
            const SizedBox(height: 20),
          ],
        ),
    );
  }
}