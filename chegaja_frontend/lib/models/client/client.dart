class Client {
  String? nome;
  String? contato;
  int? idEndereco;
  int? id;

  Client({
    this.nome,
    this.contato,
    this.idEndereco,
    this.id,
  });

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
