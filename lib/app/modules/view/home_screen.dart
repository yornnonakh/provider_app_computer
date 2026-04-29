import 'package:computer_app_provider/app/core/constants/app_colors.dart';
import 'package:computer_app_provider/app/modules/services/api_services.dart';
import 'package:computer_app_provider/app/modules/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              // ignore: deprecated_member_use
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 2),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Saerch",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                // ignore: deprecated_member_use
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 2),
              ],
            ),
            child: Icon(Icons.notifications_outlined),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: ApiService.getProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (!snapshot.hasData) {
                return Center(child: Text("No data"));
              }
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ClipRRect(
                      // borderRadius: BorderRadius.circular(20),
                      child: ImageSlideshow(
                        width: double.infinity,
                        height: 200,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          Image.network(
                            "https://i.pinimg.com/736x/bc/a5/96/bca596a83d166c064e76ea7edfffbf00.jpg",
                          ),
                          Image.network(
                            "https://i.pinimg.com/1200x/fa/4e/e5/fa4ee5eee769906bc2e374f103d59476.jpg",
                          ),
                          Image.network(
                            "https://i.pinimg.com/1200x/8c/b7/c0/8cb7c0a158a9ddb961d8369d62c8f647.jpg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "The Popular",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        TextButton(onPressed: () {}, child: Text("View All")),
                      ],
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 8 / 10,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(pro: product),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.network(
                                      product.image,
                                      width: double.infinity,
                                      height: 120,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${product.price}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
