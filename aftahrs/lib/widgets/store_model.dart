class Vendor {
  final String image;
  final String name;
  // final String rating;
  // final String phonenumber;

  Vendor({
    required this.image,
    required this.name,
    // required this.rating,
    // required this.phonenumber,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      image: json['image'] ?? 'image',
      name: json['name'] ?? 'name',
      // rating: json['rating'] ?? 'rating',
      // phonenumber: json['phonenumber'] ?? 'phone_number',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      // 'rating': rating,
      // 'phonenumber': phonenumber,
    };
  }
}



class Product {
  final String image;
  final String name;
  // final String price;
  // final String rating;

  Product({
    required this.image,
    required this.name,
    // required this.price,
    // required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'] ?? 'image',
      name: json['name'] ?? 'name',
      // price: json['price'] ?? 'price',
      // rating: json['rating'] ?? 'rating',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      // 'price': price,
      // 'rating': rating,

    };
  }
}
