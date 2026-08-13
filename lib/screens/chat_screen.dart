import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "name": "Kelly R. Hart",
      "message": "Header can ov",
      "isMe": false,
    },
    {
      "name": "Andrew R. Whitesides",
      "message": "Accepts one silver as content.",
      "isMe": true,
    },
    {
      "name": "Kelly R. Hart",
      "message": "Supports overlapping",
      "isMe": false,
    },
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      messages.add({
        "name": "Andrew R. Whitesides",
        "message": messageController.text,
        "isMe": true,
      });

      messageController.clear();
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Chat",
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

      bodyPadding: EdgeInsets.zero,

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,

              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
                  alignment: message["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),

                    padding: const EdgeInsets.all(10),

                    constraints:
                    BoxConstraints(
                      maxWidth:
                      screenwidth * 0.65,
                    ),

                    decoration: BoxDecoration(
                      color: message["isMe"]
                          ? Colors.grey.shade200
                          : Colors.cyan,

                      borderRadius:
                      BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisSize:
                      MainAxisSize.min,

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        if (!message["isMe"])
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                            AssetImage(
                              "assets/profile.png",
                            ),
                          ),

                        if (!message["isMe"])
                          const SizedBox(width: 8),

                        Flexible(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [

                              Text(
                                message["name"],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                  FontWeight.bold,
                                  color:
                                  message["isMe"]
                                      ? Colors.blueGrey
                                      : Colors.white,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                message["message"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                  message["isMe"]
                                      ? Colors.blueGrey
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (message["isMe"])
                          const SizedBox(width: 8),

                        if (message["isMe"])
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                            AssetImage(
                              "assets/profile.png",
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                ),
              ],
            ),

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: messageController,

                    decoration:
                    const InputDecoration(
                      hintText: "Chat text here",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: sendMessage,

                  icon: const Icon(
                    Icons.send_outlined,
                    color: Colors.cyan,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}