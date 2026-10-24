import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'user_model.dart';

class UserController extends ChangeNotifier {
  static const String boxName = "User Box";
  late Box _userBox;
  
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UserController() {
    _userBox = Hive.box(boxName);
    fetchUsers();
  }

  void fetchUsers() {
    _users = _userBox.keys.map((key) {
      final value = _userBox.get(key) as Map;
      return UserModel.fromMap(key, value);
    }).toList().reversed.toList();
    notifyListeners();
  }

  Future<void> saveUser(int? key) async {
    final data = {
      "name": nameController.text,
      "email": emailController.text,
    };

    if (key == null) {
      await _userBox.add(data);
    } else {
      await _userBox.put(key, data);
    }
    
    clearControllers();
    fetchUsers();
  }

  Future<void> deleteUser(int key) async {
    await _userBox.delete(key);
    fetchUsers();
  }

  void populateControllers(UserModel user) {
    nameController.text = user.name;
    emailController.text = user.email;
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
  }
  
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}