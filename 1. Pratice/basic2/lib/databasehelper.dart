import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'usermodel.dart';

class Databasehelper {
  static final Databasehelper instance = Databasehelper._init();
  static Database? _database;
  Databasehelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB();
      return _database!;
    }
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL
      )
      ''');
  }

  Future<List<Usermodel>> fetchUser() async{
    final db = await instance.database;
    final result = await db.query('user');
    return result.map((map)=> Usermodel.fromMap(map)).toList();
  }

  Future<int> addUser(Usermodel user) async{
    final db = await instance.database;
    return await db.insert('user', user.toMap());
  }

  Future<int> updateUser(Usermodel user) async{
    final db = await instance.database;
    return await db.update('user', user.toMap(),where: 'id= ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async{
    final db= await instance.database;
    return await db.delete('user', where: 'id= ?', whereArgs: [id]);
  }
}
