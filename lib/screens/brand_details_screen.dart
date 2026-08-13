import 'package:flutter/material.dart';

class BrandDetailScreen extends StatefulWidget {
  final String brandName;
  final String brandImage;

  const BrandDetailScreen({
    super.key,
    required this.brandName,
    required this.brandImage,
  });

  @override
  State<BrandDetailScreen> createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // =========================
            // BRAND HEADER
            // =========================

            Container(
              height: 190,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: Color(0xffff9075),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      Row(
                        children: [

                          IconButton(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),

                          const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                            AssetImage(
                              "assets/profile.png",
                            ),
                          ),

                          const SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Image.network(
                    widget.brandImage,

                    height: 70,
                    width: 150,

                    fit: BoxFit.contain,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return const Icon(
                        Icons.business,
                        size: 60,
                        color: Colors.white,
                      );
                    },
                  ),
                ],
              ),
            ),

            // =========================
            // TABS
            // =========================

            Row(
              children: [

                // HOME
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 0;
                      });
                    },

                    child: Container(
                      height: 55,

                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab == 0
                                ? Colors.cyan
                                : Colors.transparent,

                            width: 2,
                          ),
                        ),
                      ),

                      child: Text(
                        "Home",

                        style: TextStyle(
                          color: currentTab == 0
                              ? Colors.cyan
                              : Colors.grey,

                          fontWeight:
                          currentTab == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),

                // PRODUCTS
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 1;
                      });
                    },

                    child: Container(
                      height: 55,

                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab == 1
                                ? Colors.cyan
                                : Colors.transparent,

                            width: 2,
                          ),
                        ),
                      ),

                      child: Text(
                        "Products",

                        style: TextStyle(
                          color: currentTab == 1
                              ? Colors.cyan
                              : Colors.grey,

                          fontWeight:
                          currentTab == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),

                // REVIEWS
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 2;
                      });
                    },

                    child: Container(
                      height: 55,

                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab == 2
                                ? Colors.cyan
                                : Colors.transparent,

                            width: 2,
                          ),
                        ),
                      ),

                      child: Text(
                        "Reviews",

                        style: TextStyle(
                          color: currentTab == 2
                              ? Colors.cyan
                              : Colors.grey,

                          fontWeight:
                          currentTab == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // =========================
            // CONTENT
            // =========================

            Expanded(
              child: IndexedStack(
                index: currentTab,

                children: [

                  homeContent(),

                  productsContent(),

                  reviewsContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // HOME CONTENT
  // ==========================================================

  Widget homeContent() {
    return SingleChildScrollView(
      child: Column(
        children: [

          const SizedBox(height: 20),

          // COLLECTION BANNER
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),

            height: 145,

            width: double.infinity,

            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(10),

              child: Stack(
                children: [

                  Image.network(
                    "https://images.unsplash.com/photo-1516979187457-637abb4f9353",

                    width: double.infinity,
                    height: double.infinity,

                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    right: 15,
                    top: 25,

                    child: Column(
                      children: [

                        const Text(
                          "A room without\n"
                              "books is like a\n"
                              "body without a",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentTab = 1;
                            });
                          },

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.cyan,

                            foregroundColor:
                            Colors.white,

                            elevation: 0,

                            minimumSize:
                            const Size(110, 38),

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                25,
                              ),
                            ),
                          ),

                          child:
                          const Text("Collection"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          // DESCRIPTION
          Row(
            children: [

              const SizedBox(width: 20),

              const Icon(
                Icons.star_outline,
                color: Colors.cyan,
              ),

              const SizedBox(width: 15),

              const Text(
                "Description",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff075B70),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Text(
              "We're all going somewhere. And whether "
                  "it's the podcast blaring from your headphones "
                  "as you walk down the street or the essay that "
                  "encourages you to take on that big project, "
                  "there's a real joy in getting lost in the kind "
                  "of story that feels like a destination unto "
                  "itself.",

              style: TextStyle(
                fontSize: 13,
                color: Colors.blueGrey,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // FEATURED PRODUCTS
          Row(
            children: [

              const SizedBox(width: 20),

              const Icon(
                Icons.local_offer_outlined,
                color: Colors.cyan,
              ),

              const SizedBox(width: 15),

              const Text(
                "Featured Products",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff075B70),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 180,

            child: ListView(
              scrollDirection: Axis.horizontal,

              padding:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              children: [

                productCard(
                  "Product 1",
                  "Rs: 2500",
                ),

                productCard(
                  "Product 2",
                  "Rs: 3200",
                ),

                productCard(
                  "Product 3",
                  "Rs: 4500",
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ==========================================================
  // PRODUCTS CONTENT
  // ==========================================================

  Widget productsContent() {
    return GridView.builder(
      padding: const EdgeInsets.all(15),

      itemCount: 6,

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 10,

        mainAxisSpacing: 10,

        childAspectRatio: 0.70,
      ),

      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
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
                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff",

                  width: double.infinity,

                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "${widget.brandName} Product ${index + 1}",

                maxLines: 1,

                overflow:
                TextOverflow.ellipsis,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Rs: 2500",

                style: TextStyle(
                  color: Colors.cyan,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==========================================================
  // REVIEWS CONTENT
  // ==========================================================

  Widget reviewsContent() {
    return ListView(
      padding: const EdgeInsets.all(15),

      children: [

        Text(
          "${widget.brandName} Reviews",

          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff075B70),
          ),
        ),

        const SizedBox(height: 20),

        reviewCard(
          "Andrew R. Whitesides",
          "Very good quality products.",
          5,
        ),

        reviewCard(
          "Kelly R. Hart",
          "I really like this brand.",
          4,
        ),

        reviewCard(
          "John Smith",
          "Fast delivery and good quality.",
          5,
        ),
      ],
    );
  }

  // ==========================================================
  // PRODUCT CARD
  // ==========================================================

  Widget productCard(
      String name,
      String price,
      ) {
    return Container(
      width: 140,

      margin:
      const EdgeInsets.only(right: 10),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
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
              "https://images.unsplash.com/photo-1542291026-7eec264c27ff",

              width: double.infinity,

              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,

            maxLines: 1,

            overflow:
            TextOverflow.ellipsis,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            price,

            style: const TextStyle(
              color: Colors.cyan,

              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // REVIEW CARD
  // ==========================================================

  Widget reviewCard(
      String name,
      String review,
      int rating,
      ) {
    return Container(
      margin:
      const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(10),
      ),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const CircleAvatar(
            radius: 22,

            backgroundImage:
            AssetImage(
              "assets/profile.png",
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  name,

                  style: const TextStyle(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: List.generate(
                    rating,

                        (index) {
                      return const Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.orange,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  review,

                  style: const TextStyle(
                    color: Colors.blueGrey,
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