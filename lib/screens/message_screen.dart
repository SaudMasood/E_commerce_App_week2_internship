import 'package:ecommerce_app/screens/chat_screen.dart';
import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final searchController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "image": "assets/profile.png",
      "name": "Kelly R. Hart",
      "message": "Supports overlapping",
      "time": "63min ago",
      "color": Colors.green,
    },
    {
      "image": "assets/profile.png",
      "name": "Carol R. Hansen",
      "message": "Flutter project, add the following dependency",
      "time": "32min ago",
      "color": Colors.red,
    },
    {
      "image": "assets/profile.png",
      "name": "Douglas M. Kirkpatrick",
      "message": "Accepts one silver as content.",
      "time": "1day ago",
      "color": Colors.orange,
    },
    {
      "image": "assets/profile.png",
      "name": "John R. Whipple",
      "message": "Can scroll in any direction.",
      "time": "63min ago",
      "color": Colors.green,
    },
    {
      "image": "assets/profile.png",
      "name": "Jordan P. Jeffries",
      "message": "For help getting started with Flutter",
      "time": "31min ago",
      "color": Colors.orange,
    },
    {
      "image": "assets/profile.png",
      "name": "Michele J. Dunn",
      "message": "Accepts one silver as content.",
      "time": "45min ago",
      "color": Colors.red,
    },
    {
      "image": "assets/profile.png",
      "name": "Regina R. Risner",
      "message": "Can scroll in any direction.",
      "time": "33min ago",
      "color": Colors.green,
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
      title: "Messages",
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
              height: screenheight * 0.02,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: messages.length,

                itemBuilder: (context, index) {
                  final message =
                  messages[index];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen(),
                          ));                              },

                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 5,
                      ),

                      padding:
                      const EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(5),
                      ),

                      child: Row(
                        children: [

                          Stack(
                            children: [

                              CircleAvatar(
                                radius: 23,
                                backgroundImage:
                                AssetImage(
                                  message["image"],
                                ),
                              ),

                              Positioned(
                                right: 0,
                                bottom: 0,

                                child: Container(
                                  height: 10,
                                  width: 10,

                                  decoration:
                                  BoxDecoration(
                                    color:
                                    message["color"],
                                    shape:
                                    BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  message["name"],
                                  maxLines: 1,
                                  overflow:
                                  TextOverflow
                                      .ellipsis,

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
                                  message["message"],
                                  maxLines: 2,
                                  overflow:
                                  TextOverflow
                                      .ellipsis,

                                  style:
                                  const TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 5),

                          Text(
                            message["time"],
                            style:
                            const TextStyle(
                              fontSize: 10,
                              color: Colors.blueGrey,
                            ),
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