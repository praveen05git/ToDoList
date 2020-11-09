import 'package:flutter_plugin/repositories/database_connections.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnections _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnections();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}
