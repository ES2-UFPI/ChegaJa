class FormaPagamentoForm {
  String? numeroCartao;
  String? bandeira;
  String? dataVencimento;
  String? codigo;
  String? nomeTitular;
  String? tipoPagamento;

  FormaPagamentoForm(
      {this.numeroCartao,
      this.bandeira,
      this.dataVencimento,
      this.codigo,
      this.nomeTitular,
      this.tipoPagamento});

  FormaPagamentoForm.fromJson(Map<String, dynamic> json) {
    numeroCartao = json['numeroCartao'];
    bandeira = json['bandeira'];
    dataVencimento = json['dataVencimento'];
    codigo = json['codigo'];
    nomeTitular = json['nomeTitular'];
    tipoPagamento = json['tipoPagamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numeroCartao'] = this.numeroCartao;
    data['bandeira'] = this.bandeira;
    data['dataVencimento'] = this.dataVencimento;
    data['codigo'] = this.codigo;
    data['nomeTitular'] = this.nomeTitular;
    data['tipoPagamento'] = this.tipoPagamento;
    return data;
  }
}
