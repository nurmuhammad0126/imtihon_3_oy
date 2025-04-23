class SimpleProductModel {
   final String id;
  final String name;

  SimpleProductModel({
    required this.id,
    required this.name,
  });

  factory SimpleProductModel.fromJson(String id, Map<String, dynamic> json) {
    return SimpleProductModel(
      id: id,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}