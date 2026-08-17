import 'package:flutter/material.dart';
import 'package:ecommerce_app/scaffold/general_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  final TextEditingController searchController =
  TextEditingController();

  int currentImage = 0;

  String selectedCategory = "Man";

  final List<String> images = [
    "https://cdn.dribbble.com/userupload/39750720/file/original-669bfa70a77e38e858dc86110d8a8d57.jpg?resize=752x&vertical=center",
    "https://images.unsplash.com/photo-1525507119028-ed4c629a60a3",
    "https://images.unsplash.com/photo-1591047139829-d91aecb6caea",
  ];

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
      "category": "Bags",
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

  @override
  void dispose() {
    pageController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Home",
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;

          final bool isMobile = width < 600;
          final bool isTablet = width >= 600 && width < 900;

          final double spacing = isMobile ? 15 : 20;

          final double bannerHeight = isMobile
              ? 220
              : isTablet
              ? 240
              : 280;

          return ListView(
            padding: EdgeInsets.all(spacing),
            children: [
              // SEARCH
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.tune),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: spacing),

              // BANNER
              SizedBox(
                height: bannerHeight,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      PageView.builder(
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
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                ),
                              );
                            },
                          );
                        },
                      ),

                      // PAGE INDICATOR
                      Positioned(
                        bottom: 15,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: List.generate(
                            images.length,
                                (index) {
                              return Container(
                                margin:
                                const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                width: 30,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: currentImage == index
                                      ? const Color(0xff12B8CF)
                                      : Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: spacing),

              // FLASH SALES TITLE
              Row(
                children: [
                  const Icon(Icons.campaign_outlined),

                  SizedBox(width: isMobile ? 10 : 15),

                  const Text(
                    "Flash Sales",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    "End in 19:30:15",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: spacing),

              // FLASH SALES GRID
              buildProductGrid(
                context,
                products.take(4).toList(),
              ),

              SizedBox(height: spacing + 5),

              // RECOMMENDED TITLE
              const Row(
                children: [
                  Icon(Icons.star_outline),
                  SizedBox(width: 12),
                  Text(
                    "Recommended For You",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: spacing),

              // CATEGORIES
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategoryButton(
                        icon: Icons.man,
                        name: "Man",
                      ),
                      buildCategoryButton(
                        icon: Icons.woman,
                        name: "Women",
                      ),
                      buildCategoryButton(
                        icon: Icons.shopping_bag_outlined,
                        name: "Bags",
                      ),
                      buildCategoryButton(
                        icon: Icons.checkroom,
                        name: "Cloth",
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: spacing),

              // FILTERED PRODUCTS
              buildProductGrid(
                context,
                products
                    .where(
                      (product) =>
                  product["category"] ==
                      selectedCategory,
                )
                    .toList(),
              ),

              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }

  // CATEGORY BUTTON
  Widget buildCategoryButton({
    required IconData icon,
    required String name,
  }) {
    final bool selected = selectedCategory == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = name;
        });
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white
              : const Color(0xff12B8CF),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xff12B8CF),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? const Color(0xff12B8CF)
                  : Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              name,
              style: TextStyle(
                color: selected
                    ? const Color(0xff12B8CF)
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PRODUCT GRID
  Widget buildProductGrid(
      BuildContext context,
      List<Map<String, dynamic>> productList,
      ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        int crossAxisCount;

        if (width < 500) {
          crossAxisCount = 2;
        } else if (width < 800) {
          crossAxisCount = 3;
        } else if (width < 1200) {
          crossAxisCount = 4;
        } else {
          crossAxisCount = 5;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          itemCount: productList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,

            // Responsive card size
            childAspectRatio: width < 500
                ? 0.62
                : width < 800
                ? 0.68
                : 0.72,
          ),
          itemBuilder: (context, index) {
            final product = productList[index];

            return buildProductCard(product);
          },
        );
      },
    );
  }

  // PRODUCT CARD
  Widget buildProductCard(
      Map<String, dynamic> product,
      ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          // PRODUCT IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(8),
              child: Image.network(
                product["image"],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // NAME
          Text(
            product["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          // PRICE
          Text(
            "Rs: ${product["price"]}",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xff12B8CF),
            ),
          ),

          const SizedBox(height: 5),

          // SALES + RATING
          Text(
            "${product["sales"]}  ⭐ ${product["rating"]}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 7),

          // PROGRESS
          LinearProgressIndicator(
            value: product["progress"],
            minHeight: 5,
            borderRadius:
            BorderRadius.circular(10),
            backgroundColor:
            Colors.grey.shade300,
            valueColor:
            const AlwaysStoppedAnimation(
              Colors.red,
            ),
          ),

          const SizedBox(height: 6),

          // AVAILABLE
          Text(
            product["available"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}