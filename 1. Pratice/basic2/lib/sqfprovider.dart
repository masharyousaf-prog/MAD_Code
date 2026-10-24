import 'databasehelper.dart';
import 'usermodel.dart';

import 'package:flutter/material.dart';

class Sqfprovider extends ChangeNotifier {
  List<Usermodel> _users = [];
  bool _isLoading = true;
  int? _editingID;
  String? _errorMessage;

  List<Usermodel> get users => _users;
  bool get isLoading => _isLoading;
  int? get editingID => _editingID;
  String? get errorMessage => _errorMessage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Sqfprovider(){
    fetchUser();
  }

  Future<void> fetchUser() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      _users = await Databasehelper.instance.fetchUser();
    } catch (e) {
      _errorMessage = "Error in getting data $e";
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addUser(String name, String email) async {
    final instance = Databasehelper.instance;
    Usermodel newUser = Usermodel(name: name, email: email);
    await instance.addUser(newUser);
    await fetchUser();
  }

  Future<void> updateUser(int id, String name, String email) async {
    final instance = Databasehelper.instance;
    Usermodel updatedUser = Usermodel(id: id, name: name, email: email);
    await instance.updateUser(updatedUser);
    _editingID = null;
    await fetchUser();
  }

  Future<void> deleteUser(int id) async {
    final instance = Databasehelper.instance;
    await instance.deleteUser(id);

    await fetchUser();
  }

  void setupFormForEdit(Usermodel user) {
    nameController.text = user.name;
    emailController.text = user.email;
    _editingID = user.id;
  }

  void setupFormForAdd() {
    _editingID = null;
    nameController.text = '';
    emailController.text = '';
  }

  Future<void> submitForm() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      return;
    }
    if (editingID == null) {
      await addUser(nameController.text, emailController.text);
    }
    if (editingID != null) {
      await updateUser(_editingID!, nameController.text, emailController.text);
    }
  }

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
