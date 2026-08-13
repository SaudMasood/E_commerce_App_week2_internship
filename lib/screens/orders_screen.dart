import 'package:ecommerce_app/screens/favorite_screen.dart';
import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';


class OrdersScreen extends StatefulWidget {
const   OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {


  late final double screenhight=MediaQuery.of(context).size.height;
  late final double screenwidth=MediaQuery.of(context).size.width;


  final List<Map<String, dynamic>> products = [
    {
      "image":
      "https://images.unsplash.com/photo-1551028719-00167b16eac5",
      "name": "Maxi Dress",
      "price": "45.2",
      "sales": "130 sales",
      "rating": "4.3",
      "available": "24 available",
      "progress": 0.24,
      "category": "Women",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1591047139829-d91aecb6caea",
      "name": "Men Jacket",
      "price": "65.5",
      "sales": "95 sales",
      "rating": "4.5",
      "available": "35 available",
      "progress": 0.35,
      "category": "Man",

    },
    {
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "name": "Sports Shoes",
      "price": "55.9",
      "sales": "210 sales",
      "rating": "4.7",
      "available": "45 available",
      "progress": 0.45,
      "category": "Man",

    },
    {
      "image":
      "https://images.unsplash.com/photo-1525507119028-ed4c629a60a3",
      "name": "Women Fashion",
      "price": "75.2",
      "sales": "160 sales",
      "rating": "4.4",
      "available": "30 available",
      "progress": 0.30,
      "category": "Women",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
      "name": "Casual T-Shirt",
      "price": "25.5",
      "sales": "180 sales",
      "rating": "4.6",
      "available": "40 available",
      "progress": 0.40,
      "category": "Man",

    },
    {
      "image":
      "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
      "name": "Leather Bag",
      "price": "80.0",
      "sales": "75 sales",
      "rating": "4.5",
      "available": "20 available",
      "progress": 0.20,
      "category": "Bag",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
      "name": "Summer Outfit",
      "price": "60.5",
      "sales": "145 sales",
      "rating": "4.2",
      "available": "32 available",
      "progress": 0.32,
      "category": "Women",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1490481651871-ab68de25d43d",
      "name": "Fashion Collection",
      "price": "95.0",
      "sales": "120 sales",
      "rating": "4.8",
      "available": "28 available",
      "progress": 0.28,
      "category": "Women",
    },
    {
      "image":
      "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f",
      "name": "Men Casual Wear",
      "price": "50.0",
      "sales": "110 sales",
      "rating": "4.5",
      "available": "25 available",
      "progress": 0.25,
      "category": "Man",
    },

  ];

  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "My Orders",

      bodyPadding: const EdgeInsets.all(10),
      body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [

                  Container(

                    height: screenhight*0.05,
                    width: screenwidth*0.24,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(25),

                    ),

                        child: Center(
                          child: Text("All",style: TextStyle(
                            fontSize: 15, color: Colors.white
                              ,fontWeight: FontWeight.bold
                                ),

                          ),
                        ),

                   ),

                      SizedBox(width: screenwidth*0.02,),

                  Container(

                    height: screenhight*0.05,
                    width: screenwidth*0.24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.cyan,
                        width: 2                    ),
                      borderRadius: BorderRadius.circular(25),

                    ),

                    child: Center(
                      child: Text("Unpaid",style: TextStyle(
                          fontSize: 15, color: Colors.cyan
                          ,fontWeight: FontWeight.bold
                      ),

                      ),
                    ),

                  ),


                  SizedBox(width: screenwidth*0.02,),

                  Container(

                    height: screenhight*0.05,
                    width: screenwidth*0.24,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyan,
                          width: 2                    ),
                      borderRadius: BorderRadius.circular(25),

                    ),

                    child: Center(
                      child: Text("Shipped",style: TextStyle(
                          fontSize: 15, color: Colors.cyan
                          ,fontWeight: FontWeight.bold
                      ),

                      ),
                    ),

                  ),

                  SizedBox(width: screenwidth*0.02,),

                  Container(

                    height: screenhight*0.05,
                    width: screenwidth*0.24,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.cyan,
                          width: 2                    ),
                      borderRadius: BorderRadius.circular(25),

                    ),

                    child: Center(
                      child: Text("To be ship",style: TextStyle(
                          fontSize: 15, color: Colors.cyan
                          ,fontWeight: FontWeight.bold
                      ),

                      ),
                    ),

                  ),
                ],
              ),


            ),

            SizedBox(height: screenhight*0.04,),

            Row(
             // spacing: ,
              children: [

                Icon(Icons.all_inbox_outlined),

                SizedBox(width: screenwidth*0.04,),

                Flexible(
                  child: Text("Orders List",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                ),

                Spacer(),

                IconButton(onPressed: (){
                          setState(() {
                            isGridView=false;
                          });
                }, icon:Icon(Icons.list
                , color: !isGridView ? Colors.cyan : Colors.grey,
                )
                ),

                SizedBox(width: screenwidth*0.001,),

                IconButton(onPressed: (){
                    setState(() {
                      isGridView=true;
                    });
                        }, icon:Icon(Icons.grid_view,
                  color: isGridView ? Colors.cyan : Colors.grey,


                ) ),


              ],
            ),






            SizedBox(
              height: screenhight * 0.02,
            ),




        isGridView
            ? LayoutBuilder(
          builder: (context, constraints) {
            final gridWidth = constraints.maxWidth;
            final crossAxisCount = gridWidth >= 900
                ? 4
                : gridWidth >= 600
                ? 3
                : 2;
            final childAspectRatio = crossAxisCount >= 3 ? 0.62 : 0.48;

            return GridView.builder(
          gridDelegate:
           SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
          ),

          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),

          itemCount: products.length,

          itemBuilder: (context, index) {
            final product = products[index];

            return Container(
              padding:  EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Image.network(
                      product["image"],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(
                    height: screenhight * 0.01,
                  ),

                  Text(
                    product["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: screenhight * 0.01,
                  ),

                  Text(
                    "Rs: ${product["price"]}",
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),

                  SizedBox(
                    height: screenhight * 0.01,
                  ),

                  Text(
                    "${product["sales"]}   ⭐ ${product["rating"]}",
                    style:  TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(
                    height: screenhight * 0.01,
                  ),

                  LinearProgressIndicator(
                    value: product["progress"],
                    minHeight: 5,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.grey.shade300,
                    valueColor:
                     AlwaysStoppedAnimation<Color>(
                      Colors.red,
                    ),
                  ),

                  SizedBox(
                    height: screenhight * 0.01,
                  ),

                  Text(
                    product["available"],
                    style:  TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        );

          },
        )
            : ListView.builder(
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),

          itemCount: products.length,

          itemBuilder: (context, index) {
            final product = products[index];

            return Container(
              margin:  EdgeInsets.only(bottom: 10),
              padding:  EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                children: [

                  Image.network(
                    product["image"],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),

                   SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          product["name"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                         SizedBox(height: 8),

                        Text(
                          "Rs: ${product["price"]}",
                          style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),

                         SizedBox(height: 8),

                        Text(
                          "${product["sales"]}   ⭐ ${product["rating"]}",
                          style:  TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),

                         SizedBox(height: 8),

                        LinearProgressIndicator(
                          value: product["progress"],
                          minHeight: 5,
                          borderRadius:
                          BorderRadius.circular(10),
                          backgroundColor:
                          Colors.grey.shade300,
                          valueColor:
                           AlwaysStoppedAnimation<Color>(
                            Colors.red,
                          ),
                        ),

                         SizedBox(height: 8),

                        Text(
                          product["available"],
                          style:  TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
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
