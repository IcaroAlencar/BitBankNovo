import 'package:bitbanknovo/components/botao.dart';
import 'package:bitbanknovo/screens/contatos_list.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BitBank'),
        ),
        body: ItemPrincipal(),
      ),
    );
  }
}

class ItemPrincipal extends StatelessWidget {
  const ItemPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/nulogo.png'),
          ),
          Botao('Contatos', Icons.people, ContatoList()),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        );
  }
}