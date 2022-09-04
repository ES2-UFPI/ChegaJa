class Address {
  String? bairro;
  String? logradouro;
  String? complemento;
  String? cep;
  String? longitude;
  String? latitude;
  String? uf;
  String? numero;

  Address(
      {this.bairro,
      this.logradouro,
      this.complemento,
      this.cep,
      this.longitude,
      this.latitude,
      this.uf,
      this.numero});

  Address.fromJson(Map<String, dynamic> json) {
    bairro = json['bairro'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    cep = json['cep'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    uf = json['uf'];
    numero = json['numeroCasa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bairro'] = bairro;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['cep'] = cep;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['uf'] = uf;
    data['numeroCasa'] = numero;
    return data;
  }
}
