import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() =>
      _HelpSupportScreenState();
}

class _HelpSupportScreenState
    extends State<HelpSupportScreen> {
  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final searchController = TextEditingController();

  String selectedTab = "Product";

  final List<Map<String, dynamic>> faqList = [
    {
      "question":
      "Gluten-free spaghetti with tomatoes?",
      "answer":
      "Gluten-free spaghetti with tomatoes Gluten-free spaghetti with tomatoes",
    },
    {
      "question":
      "Gluten-free spaghetti with tomatoes?",
      "answer":
      "Gluten-free spaghetti with tomatoes Gluten-free spaghetti with tomatoes",
    },
    {
      "question":
      "Gluten-free spaghetti with tomatoes?",
      "answer":
      "Gluten-free spaghetti with tomatoes Gluten-free spaghetti with tomatoes",
    },
    {
      "question":
      "Gluten-free spaghetti with tomatoes?",
      "answer":
      "Gluten-free spaghetti with tomatoes Gluten-free spaghetti with tomatoes",
    },
    {
      "question":
      "Gluten-free spaghetti with tomatoes?",
      "answer":
      "Gluten-free spaghetti with tomatoes Gluten-free spaghetti with tomatoes",
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Help & Support",
      appBarColor: Colors.cyan,
      titleColor: Colors.white,

      actions: const [
        Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 15),
      ],

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(45),

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [
            Expanded(child: tabButton("Product")),
            Expanded(child: tabButton("Service")),
            Expanded(child: tabButton("Delivery")),
            Expanded(child: tabButton("Misc")),
          ],
        ),
      ),

      bodyPadding: const EdgeInsets.all(12),

      body: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(
              height: screenheight * 0.06,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(10),
              ),

              child: TextField(
                controller: searchController,

                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon:
                  Icon(Icons.search),
                  suffixIcon:
                  Icon(Icons.tune),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.025,
            ),

            Row(
              children: const [
                Icon(
                  Icons.help,
                  color: Colors.blueGrey,
                ),

                SizedBox(width: 20),

                Text(
                  "Faq",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: screenheight * 0.015,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: faqList.length,

                itemBuilder: (context, index) {
                  final faq = faqList[index];

                  return Container(
                    margin:
                    const EdgeInsets.only(
                      bottom: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(5),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Container(
                          width: double.infinity,
                          padding:
                          const EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius:
                            const BorderRadius.only(
                              topLeft:
                              Radius.circular(5),
                              topRight:
                              Radius.circular(5),
                            ),
                          ),

                          child: Text(
                            faq["question"],
                            style:
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.all(10),

                          child: Text(
                            faq["answer"],
                            style:
                            const TextStyle(
                              fontSize: 11,
                              color:
                              Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }

  Widget tabButton(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selectedTab == title
                  ? Colors.white
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),

        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: selectedTab == title
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}