import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  final String category;

  const ProductListScreen({
    super.key,
    required this.category,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  late final double screenhight =
      MediaQuery.of(context).size.height;

  late final double screenwidth =
      MediaQuery.of(context).size.width;

  final search = TextEditingController();

  bool isGridView = true;

  final List<Map<String, dynamic>> products = [

    {
      "image":
      "https://images.unsplash.com/photo-1551028719-00167b16eac5",
      "name": "Fashion Baby Skirt",
      "price": "42.63",
      "sales": "2554 Sales",
      "rating": "3.1",
      "category": "Jacket",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1591047139829-d91aecb6caea",
      "name": "Children Martin Boots",
      "price": "42.63",
      "sales": "2554 Sales",
      "rating": "3.1",
      "category": "Jacket",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "name": "Sports Shoes",
      "price": "55.90",
      "sales": "210 Sales",
      "rating": "4.7",
      "category": "Socks",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
      "name": "Casual Shirt",
      "price": "25.50",
      "sales": "180 Sales",
      "rating": "4.6",
      "category": "Shirt",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
      "name": "Leather Bag",
      "price": "80.00",
      "sales": "75 Sales",
      "rating": "4.5",
      "category": "Jacket",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
      "name": "Summer Outfit",
      "price": "60.50",
      "sales": "145 Sales",
      "rating": "4.2",
      "category": "Sweater",
    },

  ];

  @override
  Widget build(BuildContext context) {

    final filteredProducts = products
        .where(
          (product) =>
      product["category"] == widget.category,
    )
        .toList();

    return GeneralScaffold(
      title: widget.category,
      showAppBar: false,
      showDrawer: false,

      body: SafeArea(

        child: ListView(

          children: [

            // TOP HEADER
            Container(

              constraints: BoxConstraints(
                minHeight: screenhight * 0.25,
              ),

              decoration: BoxDecoration(
                color: Colors.cyan,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(

                children: [

                  // TOP ROW
                  Row(
                    children: [

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      Spacer(),

                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),

                      SizedBox(width: 15),

                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                        AssetImage(
                          "assets/profile.png",
                        ),
                      ),

                      SizedBox(width: 15),
                    ],
                  ),

                  SizedBox(height: 15),

                  // CATEGORY ICON
                  Icon(
                    Icons.checkroom,
                    size: 45,
                    color: Colors.white,
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Man",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  // SUB CATEGORIES
                  SingleChildScrollView(

                    scrollDirection:
                    Axis.horizontal,

                    child: Row(

                      children: [

                        SizedBox(width: 15),

                        Text(
                          "Sweater",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 25),

                        Text(
                          "Jacket",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                            widget.category ==
                                "Jacket"
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),

                        SizedBox(width: 25),

                        Text(
                          "Socks",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 25),

                        Text(
                          "Trousers",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 25),

                        Text(
                          "Shirt",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SEARCH
            SizedBox(
              height: screenhight * 0.025,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),

              child: Container(

                height: screenhight * 0.06,

                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(10),
                ),

                child: TextField(

                  controller: search,

                  decoration: InputDecoration(

                    hintText: "Search",

                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),

                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.cyan,
                    ),

                    suffixIcon: Icon(
                      Icons.tune,
                      color: Colors.grey,
                    ),

                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // TITLE
            SizedBox(
              height: screenhight * 0.03,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),

              child: Row(

                children: [

                  Icon(
                    Icons.inventory_2_outlined,
                    color: Colors.cyan,
                  ),

                  SizedBox(
                    width: screenwidth * 0.04,
                  ),

                  Flexible(
                    child: Text(
                      "${widget.category} Category",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Spacer(),

                  IconButton(
                    onPressed: () {

                      setState(() {
                        isGridView = false;
                      });

                    },

                    icon: Icon(
                      Icons.list,

                      color: !isGridView
                          ? Colors.cyan
                          : Colors.grey,
                    ),
                  ),

                  IconButton(
                    onPressed: () {

                      setState(() {
                        isGridView = true;
                      });

                    },

                    icon: Icon(
                      Icons.grid_view,

                      color: isGridView
                          ? Colors.cyan
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenhight * 0.02,
            ),

            // GRID
            isGridView

                ? LayoutBuilder(
              builder: (context, constraints) {
                final gridWidth = constraints.maxWidth;
                final crossAxisCount = gridWidth >= 900
                    ? 4
                    : gridWidth >= 600
                    ? 3
                    : 2;
                final childAspectRatio = crossAxisCount >= 3 ? 0.62 : 0.55;

                return GridView.builder(

              shrinkWrap: true,

              physics:
              NeverScrollableScrollPhysics(),

              itemCount:
              filteredProducts.length,

              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: crossAxisCount,

                crossAxisSpacing: 10,

                mainAxisSpacing: 10,

                childAspectRatio: childAspectRatio,
              ),

              itemBuilder:
                  (context, index) {

                final product =
                filteredProducts[index];

                return Container(

                  padding:
                  EdgeInsets.all(10),

                  decoration:
                  BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(10),
                  ),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Expanded(
                        child: Image.network(

                          product["image"],

                          width:
                          double.infinity,

                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(
                        height:
                        screenhight * 0.01,
                      ),

                      Text(

                        product["name"],

                        maxLines: 2,

                        overflow:
                        TextOverflow.ellipsis,

                        style: TextStyle(

                          fontSize: 14,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height:
                        screenhight * 0.01,
                      ),

                      Text(

                        "Rs: ${product["price"]}",

                        style: TextStyle(

                          fontSize: 17,

                          fontWeight:
                          FontWeight.bold,

                          color: Colors.cyan,
                        ),
                      ),

                      SizedBox(
                        height:
                        screenhight * 0.01,
                      ),

                      Row(

                        children: [

                          Text(
                            product["sales"],

                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),

                          Spacer(),

                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.amber,
                          ),

                          SizedBox(width: 3),

                          Text(
                            product["rating"],

                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  );
                },
              );

              },
            )

            // LIST
                : ListView.builder(

              shrinkWrap: true,

              physics:
              NeverScrollableScrollPhysics(),

              itemCount:
              filteredProducts.length,

              itemBuilder:
                  (context, index) {

                final product =
                filteredProducts[index];

                return Container(

                  margin:
                  EdgeInsets.only(
                    bottom: 10,
                  ),

                  padding:
                  EdgeInsets.all(10),

                  decoration:
                  BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(10),
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

                              overflow:
                              TextOverflow.ellipsis,

                              style: TextStyle(

                                fontSize: 16,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(

                              "Rs: ${product["price"]}",

                              style: TextStyle(

                                fontSize: 18,

                                fontWeight:
                                FontWeight.bold,

                                color: Colors.cyan,
                              ),
                            ),

                            SizedBox(height: 8),

                            Row(

                              children: [

                                Text(
                                  product["sales"],

                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                SizedBox(width: 10),

                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.amber,
                                ),

                                SizedBox(width: 3),

                                Text(
                                  product["rating"],

                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}