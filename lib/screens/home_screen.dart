import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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



  final PageController pageController = PageController();

  late final double screenhight=MediaQuery.of(context).size.height;
  late final double screenwidth=MediaQuery.of(context).size.width;
  String selectedCategory = "Man";
  int currentImage = 0;

  final List<String> images = [
    "https://cdn.dribbble.com/userupload/39750720/file/original-669bfa70a77e38e858dc86110d8a8d57.jpg?resize=752x&vertical=center",
    "https://images.unsplash.com/photo-1525507119028-ed4c629a60a3",
    "https://images.unsplash.com/photo-1591047139829-d91aecb6caea",
  ];


  final search=TextEditingController();
  @override
  Widget build(BuildContext context) {



    final filteredProducts = products
        .skip(4)
        .where(
          (product) => product["category"] == selectedCategory,
    )
        .toList();


    return GeneralScaffold(
      title: "Home",
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: [
              Container(
                padding:  EdgeInsets.all( 12),

                height: screenhight*0.06 ,

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
              SizedBox(height: screenhight*0.05,),

        Container(
          width: screenwidth * 0.9,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              Positioned(
                bottom: 20,
                left: 0,
                right: -200,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenwidth*0.07,
                      height: 4,

                      decoration: BoxDecoration(
                        color: currentImage == 0
                            ?  Color(0xff12B8CF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                     SizedBox(width: 5),

                    Container(
                      width: screenwidth*0.07,
                      height: 4,
                      decoration: BoxDecoration(
                        color: currentImage == 1
                            ?  Color(0xff12B8CF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                     SizedBox(width: 5),

                    Container(
                      width: screenwidth*0.07,
                      height: 4,

                      decoration: BoxDecoration(
                        color: currentImage == 2
                            ?  Color(0xff12B8CF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenhight*0.03,),
          Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.campaign_outlined),
              SizedBox(width: screenwidth*0.07),
              Expanded(
                child: Text("Flash Sales",style:
                  TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold
                  ),),
              ),
              Spacer(),

              Expanded(
                child: Flexible(
                  child: Text("End in 19:30:15",maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  fontSize: 14
                ),),
                ),
              ),
            ],
          ),

          SizedBox(height: screenhight*0.03,),




















        LayoutBuilder(
          builder: (context, constraints) {
            final gridWidth = constraints.maxWidth;
            final crossAxisCount = gridWidth >= 900
                ? 4
                : gridWidth >= 600
                ? 3
                : 2;
            final childAspectRatio = crossAxisCount >= 3 ? 0.62 : 0.48;

            return GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
          ),


          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),

          itemCount: products.length >= 4
              ? 4
              : products.length,
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

                  SizedBox(height: screenhight * 0.01),

                  Text(
                    product["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: screenhight * 0.01),

                  Text(
                    "Rs: ${product["price"]}",
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),

                  SizedBox(height: screenhight * 0.01),

                  Text(
                    "${product["sales"]}   ⭐ ${product["rating"]}",
                    style:  TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: screenhight * 0.01),

                  LinearProgressIndicator(
                    value: product["progress"],
                    minHeight: 5,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.grey.shade300,
                    valueColor:  AlwaysStoppedAnimation<Color>(
                      Colors.red,
                    ),
                  ),

                  SizedBox(height: screenhight * 0.01),

                  // Available text
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
        ),


        SizedBox(height: screenhight*0.04,),
        Row(
          children: [

            Icon(Icons.star_outline),
            SizedBox(width: screenwidth*0.07,),
            Text("Recommended For You",style:
              TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),),
          ],
        ),

        SizedBox(height: screenhight*0.04,),


















              Row(

                children: [

                 
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      width: screenwidth*0.1,
                      height: screenhight*0.06,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:  Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(width: screenwidth * 0.03),




                  Expanded(
                    flex: 2,
                    child: Container(
                      height: screenhight * 0.06,
                      width: screenwidth*0.80,
                      padding:  EdgeInsets.symmetric(
                        horizontal: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = "Man";
                                });
                              },

                              child: Container(
                                height: screenhight * 0.05,
                                width: screenwidth * 0.25,

                                decoration: BoxDecoration(
                                  color: selectedCategory == "Man"
                                      ? Colors.white
                                      : Colors.cyan,

                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,

                                  children: [

                                    Icon(
                                      Icons.man,
                                      size: 22,

                                      color: selectedCategory == "Man"
                                          ? Colors.cyan
                                          : Colors.white,
                                    ),

                                     SizedBox(width: 5),

                                    Text(
                                      "Man",

                                      style: TextStyle(
                                        color: selectedCategory == "Man"
                                            ? Colors.cyan
                                            : Colors.white,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: screenwidth * 0.04),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = "Women";
                                });
                              },

                              child: Container(
                                height: screenhight * 0.05,

                                padding:  EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: selectedCategory == "Women"
                                      ? Colors.white
                                      : Colors.cyan,

                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Row(
                                  children: [

                                    Icon(
                                      Icons.woman,
                                      size: 22,

                                      color: selectedCategory == "Women"
                                          ? Colors.cyan
                                          : Colors.white,
                                    ),

                                     SizedBox(width: 5),

                                    Text(
                                      "Women",

                                      style: TextStyle(
                                        color: selectedCategory == "Women"
                                            ? Colors.cyan
                                            : Colors.white,

                                        fontWeight: selectedCategory == "Women"
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: screenwidth * 0.04),

                            
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = "Bags";
                                });
                              },

                              child: Container(
                                height: screenhight * 0.05,

                                padding:  EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: selectedCategory == "Bags"
                                      ? Colors.white
                                      : Colors.cyan,

                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Row(
                                  children: [

                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 22,

                                      color: selectedCategory == "Bags"
                                          ? Colors.cyan
                                          : Colors.white,
                                    ),

                                     SizedBox(width: 5),

                                    Text(
                                      "Bags",

                                      style: TextStyle(
                                        color: selectedCategory == "Bags"
                                            ? Colors.cyan
                                            : Colors.white,

                                        fontWeight: selectedCategory == "Bags"
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: screenwidth * 0.04),

                            
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = "Cloth";
                                });
                              },

                              child: Container(
                                height: screenhight * 0.05,

                                padding:  EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: selectedCategory == "Cloth"
                                      ? Colors.white
                                      : Colors.cyan,

                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Row(
                                  children: [

                                    Icon(
                                      Icons.shield_rounded,
                                      size: 22,

                                      color: selectedCategory == "Cloth"
                                          ? Colors.cyan
                                          : Colors.white,
                                    ),

                                     SizedBox(width: 5),

                                    Text(
                                      "Cloth",

                                      style: TextStyle(
                                        color: selectedCategory == "Cloth"
                                            ? Colors.cyan
                                            : Colors.white,

                                        fontWeight: selectedCategory == "Cloth"
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),





              SizedBox(height: screenhight * 0.04),

              LayoutBuilder(
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

                itemCount: filteredProducts.length,

                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

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

                        SizedBox(height: screenhight * 0.01),

                        Text(
                          product["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: screenhight * 0.01),

                        Text(
                          "Rs: ${product["price"]}",
                          style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),

                        SizedBox(height: screenhight * 0.01),

                        Text(
                          "${product["sales"]}   ⭐ ${product["rating"]}",
                          style:  TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: screenhight * 0.01),

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

                        SizedBox(height: screenhight * 0.01),

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
              ),

            ]
          ),
      )
    );
  }
}
