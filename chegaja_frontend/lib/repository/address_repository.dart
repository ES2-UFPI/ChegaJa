import 'package:chegaja_frontend/models/client/address.dart';

import '../utils/endpoint_utils.dart';

class AddressRepository {
  Future<List<Address>> fetchAddresses() async {
    final response = await dio.get('endereco');

    return List<Address>.from(
      response.data['content'].map(
        (model) => Address.fromJson(model),
      ),
    );
  }

  Future<Address> createAddress(Address newAddress) async {
    final response = await dio.post('endereco', data: newAddress.toJson());
    print(response.data);
    return Address.fromJson(response.data);
  }

  Future<Address> fetchAddress(int id) async {
    final response = await dio.get('endereco/$id');

    return Address.fromJson(response.data);
  }
}
