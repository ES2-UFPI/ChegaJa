class Client {
  String? nome;
  String? contato;
  int? idEndereco;

  Client({this.nome, this.contato, this.idEndereco});

  Client.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    contato = json['contato'];
    idEndereco = json['idEndereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['contato'] = contato;
    data['idEndereco'] = idEndereco;
    return data;
  }
}
