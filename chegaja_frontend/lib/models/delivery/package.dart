class Package {
  String? descricao;
  String? codigoConfirmacao;
  String? status;
  int? idCliente;
  double? peso;

  Package(
      {this.descricao,
      this.codigoConfirmacao,
      this.status,
      this.idCliente,
      this.peso});

  Package.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    codigoConfirmacao = json['codigoConfirmacao'];
    status = json['status'];
    idCliente = json['idCliente'];
    peso = json['peso'];
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
