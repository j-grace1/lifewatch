import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationCacheDirectory();
    String path = join(documentsDirectory.path, 'LifeWatch.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE Quotes (id INTEGER PRIMARY KEY, type TEXT, CO)");
  }
}
