import 'package:bitbanknovo/dao/app_database.dart';
import 'package:bitbanknovo/models/mcontatos.dart';
import 'package:bitbanknovo/screens/formulario_contatos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ContatoList extends StatefulWidget {
  const ContatoList({Key? key}) : super(key: key);

  @override
  _ContatoListState createState() => _ContatoListState();
}

class _ContatoListState extends State<ContatoList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: Lista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => FormularioContatos(),))
              // ignore: non_constant_identifier_names
              .then((NovoContato) => _atualiza());
        }, 
        child: Icon(
          Icons.add,
          ),
        ),
        
    ),
    );
  }

  void _atualiza() {
    setState((){});
  }
}
class Lista extends StatelessWidget {

  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contatos>>(
      initialData: [],
      future: Future.delayed(Duration(seconds: 1)).then((value) => _dao.FindAll()),
      builder: (context, snapshot) {
        switch (snapshot.connectionState){
          
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            return Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Carregando...')
                ],
              ),
            );

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            final List<Contatos> contatos = snapshot.data as List<Contatos>;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contatos contato = contatos[index];
                return _ContatoItem(contato);
              },
              itemCount: contatos.length,
            );
        }

        return Text('Juro Solenimente não saber que erro é esse!');
      },
    );
  }
}


class _ContatoItem extends StatelessWidget {
  
  final Contatos contato;

  _ContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: ListTile(
              title: Text(contato.nome),
              subtitle: Text(contato.conta.toString()),
            ),
          );
  }
}