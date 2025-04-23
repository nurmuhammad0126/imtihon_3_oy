class UserProfileModel {
  final String name;
  final String address;

  UserProfileModel({
    required this.name,
    required this.address,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }
  UserProfileModel copyWith({
    String? name,
    String? address,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }
}
