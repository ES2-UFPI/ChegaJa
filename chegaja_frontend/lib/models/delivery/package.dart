class Package {
  String? descricao;
  String? codigoConfirmacao;
  String? status;
  int? idCliente;
  double? peso;
  int? id;

  Package(
      {this.descricao,
      this.codigoConfirmacao,
      this.status,
      this.idCliente,
      this.peso,
      this.id});

  Package.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    codigoConfirmacao = json['codigoConfirmacao'];
    status = json['status'];
    idCliente = json['idCliente'];
    peso = json['peso'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['codigoConfirmacao'] = codigoConfirmacao;
    data['status'] = status;
    data['idCliente'] = idCliente;
    data['peso'] = peso;
    return data;
  }
}
