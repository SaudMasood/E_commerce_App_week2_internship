import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // TextField controller
  final messageController = TextEditingController();

  // Message list
  final List<Map<String, dynamic>> messages = [
    {
      "name": "Kelly R. Hart",
      "message": "Hello, how are you?",
      "isMe": false,
    },
    {
      "name": "Andrew R. asadd",
      "message": "I'm good. How are you?",
      "isMe": true,
    },
    {
      "name": "Kelly R. Hart",
      "message": "I'm good too.",
      "isMe": false,
    },
    {
      "name": "Andrew R. Whitesides",
      "message": "Great!",
      "isMe": true,
    },
  ];

  // Send message
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

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Chat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          // MESSAGE LIST
          Expanded(
            child: ListView.builder(

              padding: const EdgeInsets.all(15),

              itemCount: messages.length,

              itemBuilder: (context, index) {

                final message = messages[index];

                bool isMe = message["isMe"];

                return Align(

                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(

                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),

                    padding: const EdgeInsets.all(12),

                    constraints: BoxConstraints(
                      maxWidth:
                      MediaQuery.of(context).size.width * 0.70,
                    ),

                    decoration: BoxDecoration(

                      color: isMe
                          ? const Color(0xff12B8CF)
                          : Colors.grey.shade200,

                      borderRadius:
                      BorderRadius.circular(15),
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          message["name"],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isMe
                                ? Colors.white
                                : Colors.blueGrey,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          message["message"],
                          style: TextStyle(
                            fontSize: 14,
                            color: isMe
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // MESSAGE INPUT
          Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
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

                // TEXT FIELD
                Expanded(
                  child: TextField(

                    controller: messageController,

                    decoration: InputDecoration(

                      hintText: "Write A Message...",

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),

                      filled: true,

                      fillColor:
                      Colors.grey.shade100,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // SEND BUTTON
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff12B8CF),
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(

                    onPressed: sendMessage,

                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
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