import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../services/api_service.dart';

class ItemProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Item> _items = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  String? _editingId;

  Future<void> fetchItems() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _items = await _apiService.fetchItems();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addItem(String title, String subtitle) async {
    // Determine sequential ID based on existing items
    int maxId = 0;
    for (var item in _items) {
      final currentId = int.tryParse(item.id) ?? 0;
      if (currentId > maxId) maxId = currentId;
    }

    final newItem = Item(
      id: (maxId + 1).toString(),
      title: title,
      subtitle: subtitle,
    );
    await _apiService.addItem(newItem);
    await fetchItems();
  }

  Future<void> updateItem(String id, String title, String subtitle) async {
    final updatedItem = Item(id: id, title: title, subtitle: subtitle);
    await _apiService.updateItem(id, updatedItem);
    await fetchItems();
  }

  Future<void> deleteItem(String id) async {
    await _apiService.deleteItem(id);
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