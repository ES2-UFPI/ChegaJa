import 'package:chegaja_frontend/models/delivery/delivery.dart';
import 'package:chegaja_frontend/utils/endpoint_utils.dart';

class DeliveryRepository {
  Future<List<Delivery>> fetchDeliveries() async {
    final response = await dio.get('entregas');

    return List<Delivery>.from(
      response.data['content'].map(
        (model) => Delivery.fromJson(model),
      ),
    );
  }

  Future<Delivery> createDelivery(Delivery newDelivery) async {
    final response = await dio.post('entregas', data: newDelivery.toJson());

    return Delivery.fromJson(response.data);
  }

  Future<Delivery> fecthDelivery(int id) async {
    final response = await dio.get('entregas/$id');

    return Delivery.fromJson(response.data);
  }
}
