import '../client/client.dart';

class Package {
  String? descricao;
  String? codigoConfirmacao;
  String? status;
  Client? clienteForm;
  double? peso;

  Package(
      {this.descricao,
      this.codigoConfirmacao,
      this.status,
      this.clienteForm,
      this.peso});

  Package.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    codigoConfirmacao = json['codigoConfirmacao'];
    status = json['status'];
    clienteForm = json['clienteDto'] != null
        ? new Client.fromJson(json['clienteDto'])
        : null;
    peso = json['peso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['codigoConfirmacao'] = this.codigoConfirmacao;
    data['status'] = this.status;
    if (this.clienteForm != null) {
      data['clienteForm'] = this.clienteForm!.toJson();
    }
    data['peso'] = this.peso;
    return data;
  }
}
