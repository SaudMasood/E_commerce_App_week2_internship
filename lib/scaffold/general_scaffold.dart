import 'package:ecommerce_app/screens/brands_screen.dart';
import 'package:ecommerce_app/screens/categories_screen.dart';
import 'package:ecommerce_app/screens/favorite_screen.dart';
import 'package:ecommerce_app/screens/help_support_screen.dart';
import 'package:ecommerce_app/screens/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/notifications_screen.dart';
import 'package:ecommerce_app/screens/orders_screen.dart';

class GeneralScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final EdgeInsetsGeometry? bodyPadding;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Color? appBarColor;
  final Color? titleColor;
  final Color? backgroundColor;
  final bool showAppBar;
  final bool showDrawer;

  const GeneralScaffold({
    super.key,
    required this.title,
    required this.body,
    this.bodyPadding,
    this.actions,
    this.leading,
    this.bottom,
    this.appBarColor,
    this.titleColor,
    this.backgroundColor,
    this.showAppBar = true,
    this.showDrawer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      drawer: showDrawer
          ? Drawer(
        width: (MediaQuery.of(context).size.width * 0.85)
            .clamp(280.0, 360.0),

        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [

              Container(
                padding: const EdgeInsets.all(20),
                color: const Color(0xffEAF7F9),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const CircleAvatar(
                      radius: 35,
                      backgroundImage:
                      AssetImage("assets/profile.png"),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Saud Masood",
                      style: TextStyle(
                        color: Color(0xff08758A),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "saudmasood974@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.notifications_none),
                title: const Text("Notifications"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const NotificationsScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.shopping_bag_outlined),
                title: const Text("My Orders"),
                trailing: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffB5D4D8),
                    ),
                  ),
                  child: const Text("8"),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrdersScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text("Wish List"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteScreen(),
                    ),
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom: 5,
                ),
                child: Text("Products"),
              ),

              ListTile(
                leading: const Icon(Icons.folder_open),
                title: const Text("Categories"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.folder_outlined),
                title: const Text("Brands"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BrandsScreen(),
                    ),
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom: 5,
                ),
                child: Text("Application Preferences"),
              ),

              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text("Help & Support"),
                onTap: () {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpSupportScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Languages"),
                onTap: () {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguagesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
          )
        : null,

      appBar: showAppBar
          ? AppBar(
        backgroundColor: appBarColor,
        leading: leading,

        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),

        actions: actions ??
            [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                color: const Color(0xff12B8CF),
              ),

              const SizedBox(width: 5),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const AccountScreen(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage:
                  AssetImage("assets/profile.png"),
                ),
              ),

              const SizedBox(width: 10),
            ],

        bottom: bottom,
          )
          : null,

      body: bodyPadding == null
          ? body
          : Padding(padding: bodyPadding!, child: body),
    );
  }
}