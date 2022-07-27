import 'package:bitbanknovo/database/app_database.dart';
import 'package:bitbanknovo/models/mcontatos.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {

  static final String tableSQL = '''CREATE TABLE contatos(
          contatosId INTEGER PRIMARY KEY, 
          contatosNome TEXT, 
          contatoConta INTEGER) ''';


// ignore: non_constant_identifier_names
Future<int> Save(Contatos contatos) async {
  final Database db = await CreateDataBase();

  // ignore: non_constant_identifier_names
    Map<String, dynamic> ContatoMap = toMap(contatos);
    return db.insert('contatos', ContatoMap);
}

Map<String, dynamic> toMap(Contatos contatos) {
    // ignore: non_constant_identifier_names
  final Map<String, dynamic> ContatoMap = Map();
  //ContatoMap['contatosId'] = contatos.id;
  ContatoMap['contatosNome'] = contatos.nome;
  ContatoMap['contatoConta'] = contatos.conta;
  return ContatoMap;
}



// ignore: non_constant_identifier_names
Future<List<Contatos>> FindAll() async {

  final Database db = await CreateDataBase();
  final List<Map<String , dynamic>> resultado = await db.query('contatos');
  final List<Contatos> contatos = [];
  for(Map<String, dynamic> map in resultado){
        // ignore: unused_local_variable
        final Contatos contato = Contatos(
        map['contatosId'],
        map['contatosNome'], 
        map['contatoConta'],
        );
        contatos.add(contato);
      }
      return contatos;
}


}