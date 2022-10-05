import 'package:chegaja_frontend/models/deliveryman/deliveryman.dart';

import '../utils/endpoint_utils.dart';

class DeliverymanRepository {
  Future<Deliveryman> createDeliveryman(Deliveryman newDeliveryman) async {
    final response = await dio.post('entregadores', data: newDeliveryman);

    return Deliveryman.fromJson(response.data);
  }

  Future putLocation(int id, double latitude, double longitude) async {
    final response = await dio.put('entregadores/$id', data: {
      "latitude": latitude,
      "longitude": longitude,
    });

    print(response.data);
    return response;
  }
}
