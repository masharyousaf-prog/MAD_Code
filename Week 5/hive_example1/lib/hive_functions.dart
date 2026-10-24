import 'hive_box_const.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
  // Box which will use to store the things
  static final Box userBox = Hive.box(userHiveBox);

  // Create or add single data in hive
  static void createUser(Map<String, dynamic> data) {
    userBox.add(data);
  }

  // Create or add multiple data in hive
  static void addAllUser(List<Map<String, dynamic>> data) {
    userBox.addAll(data);
  }

  // Get All data  stored in hive
  static List<Map<String, dynamic>> getAllUsers() {
    final data = userBox.keys.map<Map<String, dynamic>>((key) {
      final value = userBox.get(key) as Map;
      return {"key": key, "name": value["name"], "email": value['email']};
    }).toList();

    return data.reversed.toList();
  }

  // Get data for particular user in hive
  static Map<String, dynamic>? getUser(int key) {
    final value = userBox.get(key);
    return value is Map ? Map<String, dynamic>.from(value) : null;
  }

  // update data for particular user in hive
  static void updateUser(int key, Map<String, dynamic> data) {
    userBox.put(key, data);
  }

  // delete data for particular user in hive
  static Future<void> deleteUser(int key) {
    return userBox.delete(key);
  }

  // delete data for particular user in hive
  static Future<void> deleteAllUser(int key) {
    return userBox.deleteAll(userBox.keys);
  }
}
