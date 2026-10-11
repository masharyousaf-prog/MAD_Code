import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class ApiService {
  static const String _url = 'http://localhost:3000/items';

  Future<List<Item>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(_url)); 

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Item.fromJson(item)).toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> addItem(Item item) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(item.toJson()),
      );
      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to add item: $e');
    }
  }

  Future<void> updateItem(String id, Item item) async {
    try {
      final response = await http.put(
        Uri.parse('$_url/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(item.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update item: $e');
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      final response = await http.delete(Uri.parse('$_url/$id'));
      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete item: $e');
    }
  }
}