import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:oddjob/models/post.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String postTable = 'post_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance();   // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();   // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if(_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {

    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'post.db';

    // Open/create the database at a given path
    var postDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return postDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $postTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }


  // Fetch Operation: Get all Post objects from database
  Future<List<Map<String, dynamic>>> getPostMapList() async {
    Database db = await this.database;

    // two methods of doing queries, below is the 'raw' query
    //var result = await db.rawQuery('SELECT * FROM $postTable order by $colPriority ASC');
    var result = await db.query(postTable, orderBy: '$colPriority ASC'); // Helper Query
    return result;
  }

  // Insert Operation: Insert a Post object to database
  Future<int> insertPost(Post post) async {
    Database db = await this.database;
    var result = await db.insert(postTable, post.toMap());
    return result;
  }

  // Update Operation: Update a Post object and save it to database
  Future<int> updatePost(Post post) async {
    var db = await this.database;
    var result = await db.update(postTable, post.toMap(), where: '$colId = ?', whereArgs: [post.id]);
    return result;
  }

  // Delete Operation: Delete a Post object from database
  Future<int> deletePost(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $postTable WHERE $colId = $id');
    return result;
  }

  // Get number of Post objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $postTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Post List' [ List<Note> ]
  Future<List<Post>> getPostList() async {

    var postMapList = await getPostMapList(); // Get 'Map List' from database
    int count = postMapList.length;           // Count the number of map entries in db table

    List<Post> postList = List<Post>();       // Empty 'Post List'

    // For loop to create a 'Post List' from a 'Map List'
    for(int i = 0; i < count; i++) {
      postList.add(Post.fromMapObject(postMapList[i]));
    }
    return postList;
  }
}










