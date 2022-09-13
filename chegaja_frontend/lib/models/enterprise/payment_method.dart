class PaymentMethod {
  String? numeroCartao;
  String? bandeira;
  String? dataVencimento;
  String? codigo;
  String? nomeTitular;
  String? tipoPagamento;
  int? id;

  PaymentMethod({
    this.numeroCartao,
    this.bandeira,
    this.dataVencimento,
    this.codigo,
    this.nomeTitular,
    this.tipoPagamento,
    this.id,
  });

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    numeroCartao = json['numeroCartao'];
    bandeira = json['bandeira'];
    dataVencimento = json['dataVencimento'];
    codigo = json['codigo'];
    nomeTitular = json['nomeTitular'];
    tipoPagamento = json['tipoPagamento'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numeroCartao'] = numeroCartao;
    data['bandeira'] = bandeira;
    data['dataVencimento'] = dataVencimento;
    data['codigo'] = codigo;
    data['nomeTitular'] = nomeTitular;
    data['tipoPagamento'] = tipoPagamento;
    return data;
  }
}
