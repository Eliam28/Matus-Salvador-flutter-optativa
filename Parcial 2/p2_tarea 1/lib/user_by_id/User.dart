class UserName {
  final String firstname;
  final String lastname;

  UserName({
    required this.firstname,
    required this.lastname,
  });

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
    );
  }
}

class User {
  final int id;
  final String email;
  final String username;
  final String phone;
  final UserName name;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      name: UserName.fromJson(
        json['name'] as Map<String, dynamic>,
      ),
    );
  }
}