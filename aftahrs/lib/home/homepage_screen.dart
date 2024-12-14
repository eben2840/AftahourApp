import 'package:aftahrs/widgets/bottom_nav_bar.dart';
import 'package:aftahrs/widgets/store_card.dart';
import 'package:flutter/material.dart';
// import '../widgets/bottom_nav_bar.dart';
// import '.../widgets/store_card.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

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
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search restaurant and stores",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.filter_list, color: Colors.black),
                ],
              ),
              const SizedBox(height: 20),
              // Local Stores Section
              const Text(
                "Local Stores",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    StoreCard(
                      image:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/640px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
                      name: "Lorem Ipsum",
                      rating: "4.0",
                      price: "35",
                      deliveryTime: "20-40mins",
                    ),
                    SizedBox(width: 10),
                    StoreCard(
                      image:
                          "https://assets.digitalcontent.marksandspencer.app/image/upload/w_640,q_auto,f_auto/MS_FD_F01C_29420636_NC_X_EC_0",
                      name: "Lorem Ipsum",
                      rating: "4.2",
                      price: "40",
                      deliveryTime: "30-50mins",
                    ),
                    SizedBox(width: 10),
                    StoreCard(
                      image:
                          "https://assets.digitalcontent.marksandspencer.app/image/upload/w_640,q_auto,f_auto/MS_FD_F01C_29420636_NC_X_EC_0",
                      name: "Lorem Ipsum",
                      rating: "4.2",
                      price: "40",
                      deliveryTime: "30-50mins",
                    ),
                  ],
                ),
              ),

              const Text(
                "Local Stores",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    StoreCard(
                      image:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/640px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
                      name: "Lorem Ipsum",
                      rating: "4.0",
                      price: "35",
                      deliveryTime: "20-40mins",
                    ),
                    SizedBox(width: 10),
                    StoreCard(
                      image:
                          "https://assets.digitalcontent.marksandspencer.app/image/upload/w_640,q_auto,f_auto/MS_FD_F01C_29420636_NC_X_EC_0",
                      name: "Lorem Ipsum",
                      rating: "4.2",
                      price: "40",
                      deliveryTime: "30-50mins",
                    ),
                    SizedBox(width: 10),
                    StoreCard(
                      image:
                          "https://assets.digitalcontent.marksandspencer.app/image/upload/w_640,q_auto,f_auto/MS_FD_F01C_29420636_NC_X_EC_0",
                      name: "Lorem Ipsum",
                      rating: "4.2",
                      price: "40",
                      deliveryTime: "30-50mins",
                    ),
                  ],
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
