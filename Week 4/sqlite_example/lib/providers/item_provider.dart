import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../services/database_helper.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  int? _editingId;

  Future<void> fetchItems() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _items = await DatabaseHelper.instance.fetchItems();
    } catch (e) {
      _errorMessage = 'Failed to load database: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addItem(String title, String subtitle) async {
    final newItem = Item(title: title, subtitle: subtitle); // ID is auto-generated
    await DatabaseHelper.instance.addItem(newItem);
    await fetchItems();
  }

  Future<void> updateItem(int id, String title, String subtitle) async {
    final updatedItem = Item(id: id, title: title, subtitle: subtitle);
    await DatabaseHelper.instance.updateItem(updatedItem);
    await fetchItems();
  }

  Future<void> deleteItem(int id) async {
    await DatabaseHelper.instance.deleteItem(id);
    await fetchItems();
  }

  void setupFormForAdd() {
    _editingId = null;
    titleController.clear();
    subtitleController.clear();
  }

  void setupFormForEdit(Item item) {
    _editingId = item.id;
    titleController.text = item.title;
    subtitleController.text = item.subtitle;
  }

  Future<void> submitForm() async {
    if (titleController.text.isEmpty || subtitleController.text.isEmpty) return;

    if (_editingId == null) {
      await addItem(titleController.text, subtitleController.text);
    } else {
      await updateItem(_editingId!, titleController.text, subtitleController.text);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }
}