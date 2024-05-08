import 'dart:async';

import 'package:animationproject/Model/ListDownload.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io'as io;
import 'package:path/path.dart';


class DB_helper {
  static Database? _db;
  Future<Database?> get  db async{
    if(_db!=null){
      return _db!;
  }
    _db = await initDatabase();
  }
  initDatabase()async {
    io.Directory documentDirectory  = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'data.db');
    var db = await openDatabase(path,onCreate: _onCreate, version: 1);
    return db;
  }
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE data (id TEXT PRIMARY KEY , title TEXT , url TEXT )'
    );
  }
  Future<DataList> insert(DataList dataList) async {
    var dbClient = await db ;
    await dbClient!.insert('data', dataList.toJson());
    return dataList;
  }
  Future<List<DataList>> getDataList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult = await dbClient!.query('data');
    return queryResult.map((e) => DataList.fromJson(e)).toList();

  }

  Future<int> deleteData(String id) async {
    var dbClient = await db ;
    return await dbClient!.delete('data',
    where: 'id = ?' ,
      whereArgs: [id]
    );
  }

}

