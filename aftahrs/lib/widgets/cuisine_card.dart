import 'package:flutter/material.dart';

class Cuisine_Card extends StatelessWidget {
  final String image;
  final String name;
  // final String rating;
  // final String price;

  const Cuisine_Card({
    super.key,
    required this.image,
    required this.name,
    // required this.rating,
    // required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image.isNotEmpty
                  ? image
                  : "https://images.ctfassets.net/awb1we50v0om/2Spf80TME2zIhLqsi3Zxv9/919421a45f3260ee426c99c35235f1c8/Plates03__3__copy3.jpg",
              fit: BoxFit.cover, // Ensures the image covers the entire space
              height: 80,
              width: double.infinity, // Matches the container's width
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'Body',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '0.5 mil',
                          style: const TextStyle(
                            fontFamily: 'Body',
                            color: Color.fromARGB(255, 132, 12, 12),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                // const SizedBox(height: 5),
                Row(
                  children: [
                    // Add other widgets if needed
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
