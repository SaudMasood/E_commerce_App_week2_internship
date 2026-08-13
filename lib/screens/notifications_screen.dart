import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  late final double screenhight=MediaQuery.of(context).size.height;
  late final double screenwidth=MediaQuery.of(context).size.width;
  final search=TextEditingController();
  final List<Map<String, String>> notifications = [
    {
      "image":
      "https://images.unsplash.com/photo-1551028719-00167b16eac5",
      "title":
      "Lorem Ipsum is simply dummy text of the printing and ...",
      "time": "33 min ago",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "title":
      "It is a long established fact that a reader will be distracted",
      "time": "32 min ago",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
      "title":
      "There are many variations of passages of Lorem Ipsum ...",
      "time": "34 min ago",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
      "title":
      "Contrary to popular belief, Lorem Ipsum is not simply random text",
      "time": "21 min ago",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
      "title":
      "Lorem Ipsum is simply dummy text of the printing and ...",
      "time": "10 min ago",
    },
  ];  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Notifications",
      body: ListView(
          children: [ Container(
          padding:  EdgeInsets.all( 12),

          height: screenhight*0.06 ,
          width: screenwidth*0.7,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: search,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle:  TextStyle(
                color: Colors.grey,),

              prefixIcon:  Icon(Icons.search),
              suffixIcon:  Icon(Icons.tune),                border: InputBorder.none,
            ),
          ),

          ),



            SizedBox(
              height: screenhight * 0.04,
            ),

            ListView.builder(
              itemCount: notifications.length,

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemBuilder: (context, index) {

                final notification = notifications[index];

                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),

                  padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: ListTile(
                    contentPadding: EdgeInsets.zero,

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),

                      child: Image.network(
                        notification["image"]!,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      notification["title"]!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: index == 0 || index == 4
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),

                    subtitle: Text(
                      notification["time"]!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              },
            ),
      ]
        )
    );
  }
}
