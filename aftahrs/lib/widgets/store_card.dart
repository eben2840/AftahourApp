import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String image;
  final String name;
  // final String rating;
  // final String price;

  const StoreCard({
    super.key,
    required this.image,
    required this.name,
    // required this.rating,
    // required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 80,
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
                  height: 120,
                  width: double.infinity,
                ),
                // Gradient Overlay
                Container(
                  height: 120,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                // const SizedBox(height: 5),
                Row(
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,)),
                    Spacer(),
                    // Icon(Icons.star, size: 14, color: Colors.amber),
                    // Text(rating, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    // Icon(Icons.attach_money, size: 14),
                    // Text(price, style: const TextStyle(fontSize: 12)),
                    // const Spacer(),
                    // Icon(Icons.phone, size: 14),
                    // Text(phonenumber, style: const TextStyle(fontSize: 12)),
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
