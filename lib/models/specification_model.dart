class SpecificationModel {
  final String material;
  final String size;

  SpecificationModel({
    required this.material,
    required this.size,
  });

  factory SpecificationModel.fromJson(Map<String, dynamic> json) {
    return SpecificationModel(
      material: json['material'] ?? '',
      size: json['size'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'material': material,
      'size': size,
    };
  }
}
