class AdminModel {
  final String id;
  final String email;
  final String password;

  AdminModel({
    required this.id,
    required this.email,
    required this.password,
  });

  factory AdminModel.fromJson({required String id ,required Map<String, dynamic> json}) {
    return AdminModel(
      id: id,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
