class UserModel {
  String email;
  String id;
  String phone;
  int age;
  String userName;

  UserModel(
      {required this.email,
      required this.id,
      required this.phone,
      required this.age,
      required this.userName});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          phone: json['phone'],
          age: json['age'],
          userName: json['userName'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "phone": phone,
      "age": age,
      "userName": userName,
    };
  }
}
