class User {
  final String id;
  final String firstName;
  final String lastName;
  final String picture;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      picture: json['picture'],
    );
  }
}
