import 'package:chegaja_frontend/models/client/address.dart';

class Client {
  String? nome;
  String? contato;
  Address? enderecoForm;

  Client({this.nome, this.contato, this.enderecoForm});

  Client.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    contato = json['contato'];
    enderecoForm = json['enderecoDto'] != null
        ? new Address.fromJson(json['enderecoDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['contato'] = this.contato;
    if (this.enderecoForm != null) {
      data['enderecoForm'] = this.enderecoForm!.toJson();
    }
    return data;
  }
}
