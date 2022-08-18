import 'package:chegaja_frontend/models/forma_pagamento.dart';

class Empresa {
  String? email;
  String? senha;
  String? telefone;
  String? nome;
  String? cnpj;
  int? idEndereco;
  FormaPagamentoForm? formaPagamentoForm;

  Empresa(
      {this.email,
      this.senha,
      this.telefone,
      this.nome,
      this.cnpj,
      this.idEndereco,
      this.formaPagamentoForm});

  Empresa.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
    telefone = json['telefone'];
    nome = json['nome'];
    cnpj = json['cnpj'];
    idEndereco = json['idEndereco'];
    formaPagamentoForm = json['formaPagamentoForm'] != null
        ? new FormaPagamentoForm.fromJson(json['formaPagamentoForm'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['telefone'] = this.telefone;
    data['nome'] = this.nome;
    data['cnpj'] = this.cnpj;
    data['idEndereco'] = this.idEndereco;
    if (this.formaPagamentoForm != null) {
      data['formaPagamentoForm'] = this.formaPagamentoForm!.toJson();
    }
    return data;
  }
}
