class SimpleProductModel {
  final String id;
  final String name;
  final String color;
  final String gender;
  final double price;
  final double rating;
  final String image;
  final int count;

  SimpleProductModel(
      {required this.image,
      required this.id,
      required this.name,
      required this.color,
      required this.gender,
      required this.price,
      required this.rating,
      required this.count});

  factory SimpleProductModel.fromJson(String id, Map<String, dynamic> json) {
    return SimpleProductModel(
      id: id,
      count: json['count'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      color: json['color'] ?? '',
      gender: json['gender'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      'image': image,
      'id': id,
      'name': name,
      'color': color,
      'gender': gender,
      'price': price,
      'rating': rating,
    };
  }
}
