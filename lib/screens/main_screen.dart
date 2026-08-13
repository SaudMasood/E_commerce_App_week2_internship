import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'notifications_screen.dart';
import 'message_screen.dart';
import 'favorite_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 2;

  final List<Widget> screens = [
    const NotificationsScreen(),
    const AccountScreen(),
    const HomeScreen(),
    const MessagesScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),

        bottomNavigationBar: Container(
          height: 65,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  currentIndex == 0
                      ? Icons.notifications
                      : Icons.notifications_none,
                  color: currentIndex == 0
                      ? const Color(0xff12B8CF)
                      : Colors.grey,
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  currentIndex == 1
                      ? Icons.person
                      : Icons.person_outline,
                  color: currentIndex == 1
                      ? const Color(0xff12B8CF)
                      : Colors.grey,
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },

                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    color: const Color(0xff12B8CF),
                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff12B8CF)
                            .withOpacity(0.35),
                        blurRadius: 12,
                        spreadRadius: 3,
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },

                icon: Icon(
                  currentIndex == 3
                      ? Icons.chat_bubble
                      : Icons.chat_bubble_outline,
                  color: currentIndex == 3
                      ? const Color(0xff12B8CF)
                      : Colors.grey,
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },

                icon: Icon(
                  currentIndex == 4
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: currentIndex == 4
                      ? const Color(0xff12B8CF)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}