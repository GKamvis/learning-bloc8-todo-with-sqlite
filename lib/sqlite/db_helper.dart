// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper {
  static const String dbName = 'todo.sqlite';

  static Future<Database> openDb() async {
    String dbPath = join(await getDatabasesPath(), dbName);
    if (await databaseExists(dbPath)) {
      // ignore: avoid_print
      print('Database exists');
    } else {
      ByteData data = await rootBundle.load(join('database', dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print('Database copied');
    }
    return openDatabase(dbPath);
  }
}