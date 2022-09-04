import 'package:chegaja_frontend/models/client/address.dart';

import '../utils/endpoint_utils.dart';

class AddressRepository {
  Future<List<Address>> fetchAddress() async {
    final listAddress = await dio.get('endereco');

    return List<Address>.from(
      listAddress.data['content'].map(
        (model) => Address.fromJson(model),
      ),
    );
  }

  Future<Address> createAddress(Address newAddress) async {
    final response = await dio.post('endereco', data: newAddress.toJson());
    print(response.data);
    return Address.fromJson(response.data);
  }
}
