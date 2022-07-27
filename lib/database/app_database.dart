import 'package:bitbanknovo/dao/app_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: non_constant_identifier_names
Future<Database> CreateDataBase() async {

  final String path = join(await getDatabasesPath(), 'bitbank05.db');
    return openDatabase(
      path, 
      onCreate: (db, version) async {
        await db.execute(ContatoDao.tableSQL);
      }, version: 2,
      // onDowngrade: onDatabaseDowngradeDelete
    );
}
