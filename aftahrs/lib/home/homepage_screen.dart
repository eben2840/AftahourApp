import 'package:aftahrs/widgets/store_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/store_card.dart';
// import '../models/store_model.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<dynamic> vendors = [];
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchVendors();
    fetchProducts();
  }

  // Fetch Vendors
  Future<void> fetchVendors() async {
    const String vendorApiUrl =
        "https://backend.aftahrs.com/user/dashboard/token"; // Replace with your API
    try {
      final response = await http.get(Uri.parse(vendorApiUrl));
      if (response.statusCode == 200) {
        // final List<Vendor>data = json.decode(response.body)['data']['data']['vendors'];
        final data = json.decode(response.body)['data']['data']['vendors'];
        print("data");
        print(data);
        // final List<dynamic> vendordata = data['data']['data']['vendors'];
        setState(() {
          vendors = data.map((json) => Vendor.fromJson(json)).toList();
        });
        print("data");
        // print(vendordata);
      } else {
        // print("Failed to load vendors");
        throw Exception("Failed to load vendors");
      }
    } catch (e) {
      print("Error fetching vendors: $e");
    }
  }

 Future<void> fetchProducts() async {
    const String productsApiUrl =
        "https://backend.aftahrs.com/user/dashboard/token"; // Replace with your API
    try {
      final response = await http.get(Uri.parse(productsApiUrl));
      if (response.statusCode == 200) {
        // final List<products>data = json.decode(response.body)['data']['data']['productss'];
        final data = json.decode(response.body)['data']['data']['products'];
        print("data");
        print(data);
        // final List<dynamic> productsdata = data['data']['data']['productss'];
        setState(() {
          products = data.map((json) => Product.fromJson(json)).toList();
        });
        print("data");
        // print(productsdata);
      } else {
        // print("Failed to load productss");
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem Ipsum",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Lorem ipsum dolor sit",
                      style: TextStyle(fontSize: 8, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text("North Kierland",
                    style: TextStyle(fontSize: 10, color: Colors.black)),
                SizedBox(width: 5),
                Icon(Icons.location_on, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Vendors",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "More",
                    style: TextStyle(fontSize: 10, color:Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: vendors.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: vendors.length,
                        itemBuilder: (context, index) {
                          final vendor = vendors[index];
                          return StoreCard(
                            image: vendor.image,
                            name: vendor.name,
                            // rating: '',
                            // price: vendor.deliveryTime,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Products",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "More",
                    style: TextStyle(fontSize: 10, color:Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: products.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return StoreCard(
                            image: product.image,
                            name: product.name,
                            // rating: product.rating,
                            // price: product.price,
                            // deliveryTime: "In Stock",
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
    );
  }
}
