import 'payment_method.dart';

class Enterprise {
  String? email;
  String? senha;
  String? telefone;
  String? nome;
  String? cnpj;
  int? idEndereco;
  PaymentMethod? formaPagamentoForm;
  int? id;

  Enterprise({
    this.email,
    this.senha,
    this.telefone,
    this.nome,
    this.cnpj,
    this.idEndereco,
    this.formaPagamentoForm,
    this.id,
  });

  Enterprise.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
    telefone = json['telefone'];
    nome = json['nome'];
    cnpj = json['cnpj'];
    idEndereco = json['idEndereco'];
    formaPagamentoForm = json['formaPagamentoForm'] != null
        ? PaymentMethod.fromJson(json['formaPagamentoForm'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['senha'] = senha;
    data['telefone'] = telefone;
    data['nome'] = nome;
    data['cnpj'] = cnpj;
    data['idEndereco'] = idEndereco;
    if (formaPagamentoForm != null) {
      data['formaPagamentoForm'] = formaPagamentoForm!.toJson();
    }
    return data;
  }
}
