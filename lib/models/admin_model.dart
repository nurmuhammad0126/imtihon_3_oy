class AdminModel {
  final String id;
  final String email;
  final String password;

  AdminModel({
    required this.id,
    required this.email,
    required this.password,
  });

  factory AdminModel.fromJson(
      {required Map<String, dynamic> json}) {
    return AdminModel(
      id: json["id"],
      email: json['email'],
      password: json['password'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'email': email,
      'password': password,
    };
  }
}
