class Entregador {
  String? email;
  String? senha;
  String? telefone;
  String? nome;
  String? cpf;
  int? pesoMaximo;

  Entregador(
      {this.email,
      this.senha,
      this.telefone,
      this.nome,
      this.cpf,
      this.pesoMaximo});

  Entregador.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
    telefone = json['telefone'];
    nome = json['nome'];
    cpf = json['cpf'];
    pesoMaximo = json['pesoMaximo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['telefone'] = this.telefone;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['pesoMaximo'] = this.pesoMaximo;
    return data;
  }
}
