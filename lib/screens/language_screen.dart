import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() =>
      _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final searchController = TextEditingController();

  String selectedLanguage = "English";

  final List<Map<String, dynamic>> languages = [
    {
      "name": "English",
      "native": "English",
      "flag": "🇬🇧",
    },
    {
      "name": "Arabic",
      "native": "العربية",
      "flag": "🇦🇪",
    },
    {
      "name": "Spanish",
      "native": "Spanish",
      "flag": "🇪🇸",
    },
    {
      "name": "French (France)",
      "native": "Français - France",
      "flag": "🇫🇷",
    },
    {
      "name": "French (Canada)",
      "native": "Français - Canadien",
      "flag": "🇨🇦",
    },
    {
      "name": "Brazilian",
      "native": "Brazilian",
      "flag": "🇧🇷",
    },
    {
      "name": "Deutsch",
      "native": "Deutsch",
      "flag": "🇩🇪",
    },
    {
      "name": "Chinese",
      "native": "Chinese",
      "flag": "🇨🇳",
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
      title: "Languages",
      titleColor: Colors.blueGrey,

      actions: const [
        Icon(
          Icons.shopping_cart_outlined,
          color: Colors.cyan,
        ),
        SizedBox(width: 15),
        CircleAvatar(
          radius: 18,
          backgroundImage:
          AssetImage("assets/profile.png"),
        ),
        SizedBox(width: 10),
      ],

      bodyPadding: const EdgeInsets.all(12),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

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
                  Icon(Icons.translate),
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
                  Icons.translate,
                  color: Colors.blueGrey,
                ),

                SizedBox(width: 20),

                Text(
                  "App Language",
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
                itemCount: languages.length,

                itemBuilder: (context, index) {
                  final language =
                  languages[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage =
                        language["name"];
                      });
                    },

                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color:
                            Colors.grey.shade200,
                          ),
                        ),
                      ),

                      child: Row(
                        children: [

                          Container(
                            height: 32,
                            width: 32,

                            decoration:
                            const BoxDecoration(
                              shape:
                              BoxShape.circle,
                            ),

                            child: Center(
                              child: Text(
                                language["flag"],
                                style:
                                const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  language["name"],
                                  style:
                                  const TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.bold,
                                    color:
                                    Colors.blueGrey,
                                  ),
                                ),

                                const SizedBox(height: 3),

                                Text(
                                  language["native"],
                                  style:
                                  const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (selectedLanguage ==
                              language["name"])
                            const Icon(
                              Icons.check_circle,
                              color: Colors.cyan,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}