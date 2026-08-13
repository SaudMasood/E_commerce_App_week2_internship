import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> categories = [
      {
        "name": "Man",
        "icon": Icons.man,
        "subCategories": [
          "Sh",
          "Sweater",
          "Jacket",
          "Socks",
          "Trousers",
          "Shirt",
          "Sweater",
          "Jacket",
          "Socks",
          "Trousers",

        ],
      },
      {
        "name": "Women",
        "icon": Icons.woman,
        "subCategories": [
          "Sh",
          "Sweater",
          "Jacket",
          "Socks",
          "Trousers",
          "Shirt",
          "Sweater",
          "Jacket",
          "Socks",
          "Trousers",
        ],
      },
      {
        "name": "Child",
        "icon": Icons.child_care,
        "subCategories": [
          "Sh",
          "Sweater",
          "Jacket",
          "Socks",
          "Trousers",
          "Shirt",
          "Sweater",
          "Jacket",
        ],
      },
    ];
    late final double screenhight=MediaQuery.of(context).size.height;
    late final double screenwidth=MediaQuery.of(context).size.width;
    final search=TextEditingController();



    return GeneralScaffold(
      title: "Categories",

    bodyPadding: const EdgeInsets.all(12),
    body:
    ListView(
    padding: const EdgeInsets.all(14),
    children: [

      Container(
        height: screenhight * 0.06,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.tune),
            border: InputBorder.none,
          ),
        ),
      ),

      SizedBox(height: screenhight * 0.03),

      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,

        itemBuilder: (context, index) {

          final category = categories[index];

          return Container(

            margin: const EdgeInsets.only(bottom: 20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
              children: [

                // IMAGE LEFT FOR 0,2,4...
                if (index % 2 == 0)
                  Container(
                    width: screenwidth * 0.28,
                    height: 150,

                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [
                        Icon(
                          category["icon"],
                          color: Colors.white,
                          size: 35,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          category["name"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.all(10),

                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,

                      children: [
                        ...category["subCategories"]
                            .map<Widget>((subCategory) {

                          return GestureDetector(
                            onTap: () {

                              print(
                                "${category["name"]} - $subCategory",
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductListScreen(
                                    category: subCategory,
                                  ),
                                ),
                              );
                            },

                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius:
                                BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),

                              child: Text(
                                subCategory,
                                style: const TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                // IMAGE RIGHT FOR 1,3,5...
                if (index % 2 != 0)
                  Container(
                    width: screenwidth * 0.28,
                    height: 150,

                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [
                        Icon(
                          category["icon"],
                          color: Colors.white,
                          size: 35,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          category["name"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    ],
  ),
    );
  }
}