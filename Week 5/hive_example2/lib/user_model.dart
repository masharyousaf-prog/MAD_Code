class UserModel {
  final int key;
  final String name;
  final String email;

  UserModel({
    required this.key,
    required this.name,
    required this.email,
  });

  factory UserModel.fromMap(int key, Map value) {
    return UserModel(
      key: key,
      name: value['name'] ?? '',
      email: value['email'] ?? '',
    );
  }
}