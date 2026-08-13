import 'package:ecommerce_app/screens/brand_details_screen.dart';
import 'package:flutter/material.dart';

import '../scaffold/general_scaffold.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {

  final List<Map<String, String>> brands = [
    {
      "name": "Nike",
      "image": "https://logo.clearbit.com/nike.com",
    },
    {
      "name": "Adidas",
      "image": "https://logo.clearbit.com/adidas.com",
    },
    {
      "name": "Puma",
      "image": "https://logo.clearbit.com/puma.com",
    },
    {
      "name": "Gucci",
      "image": "https://logo.clearbit.com/gucci.com",
    },
    {
      "name": "Prada",
      "image": "https://logo.clearbit.com/prada.com",
    },
    {
      "name": "Zara",
      "image": "https://logo.clearbit.com/zara.com",
    },
    {
      "name": "H&M",
      "image": "https://logo.clearbit.com/hm.com",
    },
    {
      "name": "Levi's",
      "image": "https://logo.clearbit.com/levi.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Brands",

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {

            int crossAxisCount = 2;

            if (constraints.maxWidth > 900) {
              crossAxisCount = 5;
            } else if (constraints.maxWidth > 600) {
              crossAxisCount = 4;
            }

            return GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),

              itemCount: brands.length,

              itemBuilder: (context, index) {

                final brand = brands[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BrandDetailScreen(
                          brandName: brand["name"]!,
                          brandImage: brand["image"]!,
                        ),
                      ),
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Expanded(
                          child: Image.network(
                            brand["image"]!,
                            fit: BoxFit.contain,

                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.business,
                                size: 50,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          brand["name"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}