class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String profileImage;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileImage: json['profile_image'],
    );
  }
}
