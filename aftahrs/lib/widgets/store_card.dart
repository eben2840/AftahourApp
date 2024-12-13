import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String image;
  final String name;
  final String rating;
  final String price;
  final String deliveryTime;

  const StoreCard({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
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
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: [
                // Background Image
                Image.network(
                  image,
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
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
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
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    Text(rating, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 14),
                    Text(price, style: const TextStyle(fontSize: 12)),
                    const Spacer(),
                    Icon(Icons.delivery_dining, size: 14),
                    Text(deliveryTime, style: const TextStyle(fontSize: 12)),
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
