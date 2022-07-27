
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  
  final String    _titulo;
  final IconData  _icone;
  final Widget    _tela;

  const Botao(this._titulo, this._icone, this._tela); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromRGBO(111, 13, 204, 35),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => _tela,
              ));
            },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    _icone, 
                    color: Colors.white,
                    size: 32.0,
                  ),
                  Text(
                    _titulo, 
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                  )
                ),
              ),
            ),
      ),
    );
  }
}