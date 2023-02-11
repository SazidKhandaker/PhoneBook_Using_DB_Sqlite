import 'package:day29/ModelFile/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databaseclass {
  static Future databasepath() async {
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, 'model.db');

    return await openDatabase(path, onCreate: _oncreatefctn, version: 1);
  }

  static Future _oncreatefctn(Database db, int version) async {
    final mysql =
        ''' CREATE TABLE tbl(id INTEGER PRIMART KEY, name Text, phone Text)''';

    return await db.execute(mysql);
  }

  static Future<int> insertContact(Modelclass mdl) async {
    Database db = await Databaseclass.databasepath();

    return await db.insert('tbl', mdl.toMap());
  }

  static Future<List<Modelclass>> readdata() async {
    Database db = await Databaseclass.databasepath();
    var queryname = await db.query('tbl');

    List<Modelclass> readdataname = queryname.isNotEmpty
        ? queryname.map((e) => Modelclass.fromMap(e)).toList()
        : [];

    return readdataname;
  }

  static Future<int> Updateindex(Modelclass mdl) async {
    Database db = await Databaseclass.databasepath();
    return await db
        .update('tbl', mdl.toMap(), where: 'id =?', whereArgs: [mdl.id]);
  }

  static Future<int> Deletenode(int id) async {
    Database db = await Databaseclass.databasepath();

    return await db.delete('tbl', where: 'id=?', whereArgs: [id]);
  }
}
