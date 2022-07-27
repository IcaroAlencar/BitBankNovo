import 'package:bitbanknovo/dao/app_database.dart';
import 'package:bitbanknovo/models/mcontatos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioContatos extends StatelessWidget {
  const FormularioContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Novo Contato'),
        ),
        body: ItemFormulario(),
      ),
    );
  }
}

class ItemFormulario extends StatefulWidget {
  
  @override
  _ItemFormularioState createState() => _ItemFormularioState();
}

class _ItemFormularioState extends State<ItemFormulario> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _contaController = TextEditingController();

  final ContatoDao _dao = ContatoDao(); 

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CupertinoTextField(
                  controller: _nomeController,
                  placeholder: 'Nome',
                ),
              ),
              Padding(
                 padding: const EdgeInsets.only(bottom: 16),
                 child: CupertinoTextField(
                  controller: _contaController,
                   placeholder: 'Conta',
                   keyboardType: TextInputType.number,
                 ),
               ),
              CupertinoButton.filled(
                child: Text('Salvar'), 
                onPressed: () {
                  final String nome = _nomeController.text;
                  final int? conta  =  int.tryParse(_contaController.text);
                  // ignore: non_constant_identifier_names
                  final Contatos NovoContatos = Contatos(0, nome, conta!);
                  _dao.Save(NovoContatos).then((id) => Navigator.pop(context));
                })
            ],
          ),
        );
  }
}