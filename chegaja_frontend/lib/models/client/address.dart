class Address {
  String? bairro;
  String? logradouro;
  String? complemento;
  String? cep;
  String? longitude;
  String? latitude;
  String? uf;
  String? numeroCasa;

  Address(
      {this.bairro,
      this.logradouro,
      this.complemento,
      this.cep,
      this.longitude,
      this.latitude,
      this.uf,
      this.numeroCasa});

  Address.fromJson(Map<String, dynamic> json) {
    bairro = json['bairro'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    cep = json['cep'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    uf = json['uf'];
    numeroCasa = json['numeroCasa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bairro'] = this.bairro;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['cep'] = this.cep;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['uf'] = this.uf;
    data['numeroCasa'] = this.numeroCasa;
    return data;
  }
}
