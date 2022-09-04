class Delivery {
  String? data;
  String? status;
  int? valorTotal;
  int? taxaServico;
  int? peso;
  int? idEmpresa;
  int? idEntregador;
  int? id;

  Delivery({
    this.data,
    this.status,
    this.valorTotal,
    this.taxaServico,
    this.peso,
    this.idEmpresa,
    this.idEntregador,
    this.id,
  });

  Delivery.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    valorTotal = json['valorTotal'];
    taxaServico = json['taxaServico'];
    peso = json['peso'];
    idEmpresa = json['idEmpresa'];
    idEntregador = json['idEntregador'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['status'] = status;
    data['valorTotal'] = valorTotal;
    data['taxaServico'] = taxaServico;
    data['peso'] = peso;
    data['idEmpresa'] = idEmpresa;
    data['idEntregador'] = idEntregador;
    return data;
  }
}
