import 'dart:collection';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DataHelper {
  DataHelper.internal();
  static final DataHelper instance = DataHelper.internal();
  factory DataHelper() => instance;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _createDatabase();
    return _database!;
  }

  Future<Database> _createDatabase() async {
    String dataPath = await getDatabasesPath();
    String path = join(dataPath, 'storedata.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE datastoreindb (
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            price REAL NOT NULL DEFAULT 0, 
            isFavorite INTEGER NOT NULL DEFAULT 0, 
            isCart INTEGER NOT NULL DEFAULT 0
          )
          ''',
        );
      },
    );
  }

  Future<int> addItemindata(String name, double price) async {
    final db = await database;
    return await db.insert("datastoreindb", {"name": name, "price": price});
  }

  Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await database;
    return db.query("datastoreindb");
  }

  Future<int> deleteitem(int id) async {
    final db = await database;

    return await db.delete("datastoreindb", where: 'id=? ', whereArgs: [id]);
  }

  Future<int> updateitem(int id, String newname, double price) async {
    final db = await database;

    return await db.update("datastoreindb", {'name': newname, "price": price},
        where: 'id=?', whereArgs: [id]);
  }


  Future<int> addtoggleFaviour(int id, int isFavorite) async {

    final db= await database;
    return await db.update("datastoreindb", {"isFavorite": isFavorite}, where: 'id=?', whereArgs: [id]);
  }


  Future<int>  addisToCart(int id, int isCart)async{
    final db= await database;

    return await db.update("datastoreindb",{"isCart": isCart}, where: 'id=?', whereArgs:[id]);
  }


Future<List<Map<String, dynamic>>> gettoggelefaviour()async{
  final db = await database;

  return await db.query("datastoreindb", where: 'isFavorite=?', whereArgs: [1]);
}

Future<List<Map<String, dynamic>>>  getIsCart()async{
  final db = await database;

  return await db.query("datastoreindb", where: 'isCart=?', whereArgs: [1]);
}
}
