class Contatos {
  final int id;
  final String nome;
  final int conta;

  Contatos(
    this.id,
    this.nome, 
    this.conta,
    );

  @override
  String toString() {
    return 'Id: $id Nome: $nome Conta: $conta';
  }
 }