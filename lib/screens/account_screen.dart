import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late final double screenheight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final searchController = TextEditingController();

  final nameController =
  TextEditingController(text: "Andrew R. Whitesides");

  final emailController =
  TextEditingController(text: "andrew@gmail.com");

  final genderController =
  TextEditingController(text: "Male");

  final birthDateController =
  TextEditingController(text: "1993-12-31");

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    emailController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  void editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Profile Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                  ),
                ),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                  ),
                ),

                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    labelText: "Gender",
                  ),
                ),

                TextField(
                  controller: birthDateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Birth Date",
                    suffixIcon: Icon(
                      Icons.calendar_today,
                    ),
                  ),
                  onTap: () async {
                    DateTime? date =
                    await showDatePicker(
                      context: context,
                      initialDate:
                      DateTime(1993, 12, 31),
                      firstDate:
                      DateTime(1950),
                      lastDate:
                      DateTime.now(),
                    );

                    if (date != null) {
                      birthDateController.text =
                      "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                    }
                  },
                ),
              ],
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() {});

                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Account",

      body: ListView(
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

                decoration:
                const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon:
                  Icon(Icons.search),
                  suffixIcon:
                  Icon(Icons.tune),
                ),
              ),
            ),

            SizedBox(
              height: screenheight * 0.025,
            ),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      nameController.text,

                      style:
                      const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                        color:
                        Colors.blueGrey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      emailController.text,

                      style:
                      const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const CircleAvatar(
                  radius: 25,
                  backgroundImage:
                  AssetImage(
                    "assets/profile.png",
                  ),
                ),
              ],
            ),

            SizedBox(
              height: screenheight * 0.02,
            ),

            Container(
              height: 75,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(8),
              ),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,

                children: [

                  Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.favorite_border,
                      ),
                      Text("Wish List"),
                    ],
                  ),

                  Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star_border,
                      ),
                      Text("Following"),
                    ],
                  ),

                  Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.message_outlined,
                      ),
                      Text("Messages"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenheight * 0.02,
            ),

            Container(
              padding:
              const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(8),
              ),

              child: Column(
                children: [

                  Row(
                    children: [

                      const Icon(
                        Icons.shopping_bag_outlined,
                      ),

                      const SizedBox(width: 15),

                      const Text(
                        "My Orders",
                        style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          color:
                          Colors.blueGrey,
                        ),
                      ),

                      const Spacer(),

                      const Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  orderRow(
                    "Unpaid",
                    "1",
                  ),

                  orderRow(
                    "To be shipped",
                    "5",
                  ),

                  orderRow(
                    "Shipped",
                    "3",
                  ),

                  const SizedBox(height: 8),

                  const Row(
                    children: [
                      Text("In dispute"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenheight * 0.02,
            ),

            Container(
              padding:
              const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(8),
              ),

              child: Column(
                children: [

                  Row(
                    children: [

                      const Icon(
                        Icons.person_outline,
                      ),

                      const SizedBox(width: 15),

                      const Text(
                        "Profile Settings",
                        style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      GestureDetector(
                        onTap: editProfile,

                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  profileRow(
                    "Full name",
                    nameController.text,
                  ),

                  profileRow(
                    "Email",
                    emailController.text,
                  ),

                  profileRow(
                    "Gender",
                    genderController.text,
                  ),

                  profileRow(
                    "Birth Date",
                    birthDateController.text,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenheight * 0.02,
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(8),
              ),

              child: Column(
                children: [

                  ListTile(
                    leading:
                    const Icon(Icons.settings),
                    title:
                    const Text("Settings"),
                    trailing:
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                    ),
                    title:
                    const Text("Addresses"),
                    trailing:
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.language_outlined,
                    ),
                    title:
                    const Text("Languages"),
                    trailing:
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.help_outline,
                    ),
                    title:
                    const Text(
                      "Help & Support",
                    ),
                    trailing:
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
    );
  }

  Widget orderRow(
      String title,
      String number,
      ) {
    return Padding(
      padding:
      const EdgeInsets.only(bottom: 8),

      child: Row(
        children: [

          Text(title),

          const Spacer(),

          Container(
            height: 35,
            width: 35,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.cyan,
              ),
            ),

            child: Center(
              child: Text(number),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileRow(
      String title,
      String value,
      ) {
    return Padding(
      padding:
      const EdgeInsets.only(bottom: 10),

      child: Row(
        children: [

          Text(title),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}