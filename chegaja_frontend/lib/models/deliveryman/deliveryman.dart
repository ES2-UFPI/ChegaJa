class Deliveryman {
  String? email;
  String? senha;
  String? telefone;
  String? nome;
  String? cpf;
  int? pesoMaximo;

  Deliveryman(
      {this.email,
      this.senha,
      this.telefone,
      this.nome,
      this.cpf,
      this.pesoMaximo});

  Deliveryman.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
    telefone = json['telefone'];
    nome = json['nome'];
    cpf = json['cpf'];
    pesoMaximo = json['pesoMaximo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['senha'] = senha;
    data['telefone'] = telefone;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['pesoMaximo'] = pesoMaximo;
    return data;
  }
}
