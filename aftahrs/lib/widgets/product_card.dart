import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  // final String rating;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    // required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      // height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 5,
        //   )
        // ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background Image
                Image.network(
                  image.isNotEmpty ? image : "https://images.ctfassets.net/awb1we50v0om/2Spf80TME2zIhLqsi3Zxv9/919421a45f3260ee426c99c35235f1c8/Plates03__3__copy3.jpg",
                  fit: BoxFit.cover,
                  height: 140,
                  width: double.infinity,
                ),
                // Gradient Overlay
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black26,
                        Colors.black26,
                        Colors.black26,
                        // Colors.transparent,
                        Colors.black26,
                      ],
                    ),
                  ),
                ),
                Positioned(
              bottom: 10, // Adjust as needed
              left: 10, // Adjust as needed
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 215, 215),
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Text(
                  "5 + left", // Replace with your desired text
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold,
                        fontFamily: 'Body',
                         fontSize: 15,)),
                    Spacer(),
                    Icon(Icons.star,size: 18, color: Colors.amber),
                    Text("4.9", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 14, color: Color.fromARGB(255, 132, 12, 12),),
                    Text(price, style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 132, 12, 12))),
                    const Spacer(),
                    Icon(Icons.delivery_dining, size: 14),
                    Text(' 2.8 mil ', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
