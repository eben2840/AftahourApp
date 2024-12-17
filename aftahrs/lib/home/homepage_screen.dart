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
  List<Vendor> vendors = [];
  List<Product> products = [];

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
        final data = json.decode(response.body);
        final List<dynamic> vendordata = data['data']['data']['vendor'];
        setState(() {
          vendors = vendordata.map((json) => Vendor.fromJson(json)).toList();
        });
      } else {
        // print("Failed to load vendors");
        throw Exception("Failed to load vendors");
      }
    } catch (e) {
      print("Error fetching vendors: $e");
    }
  }

  // Fetch Products
  Future<void> fetchProducts() async {
    const String productApiUrl =
        "https://backend.aftahrs.com/user/dashboard/token"; // Replace with your API
    try {
      final response = await http.get(Uri.parse(productApiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          products = data.map((json) => Product.fromJson(json)).toList();
        });
      } else {
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
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vendors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            rating: '',
                            price: vendor.deliveryTime,
                            deliveryTime: vendor.deliveryTime,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                      ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            rating: product.rating,
                            price: product.price,
                            deliveryTime: "In Stock",
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
