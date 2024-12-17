class Vendor {
  final String image;
  final String name;
  final String rating;
  final String deliveryTime;

  Vendor({
    required this.image,
    required this.name,
    required this.rating,
    required this.deliveryTime,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      image: json['image'],
      name: json['name'],
      rating: json['rating'],
      deliveryTime: json['deliveryTime'],
    );
  }
}

class Product {
  final String image;
  final String name;
  final String price;
  final String rating;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
