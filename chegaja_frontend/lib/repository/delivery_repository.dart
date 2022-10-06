import 'package:chegaja_frontend/models/delivery/delivery.dart';
import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
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

  Future<List<Delivery>> fetchDeliveriesById(int id, bool isEnterprise) async {
    String path;
    isEnterprise ? path = "entregas/empresa/" : path = "entregas/entregador/";

    final response = await dio.get(path + id.toString());

    print(response.requestOptions.path);

    return List<Delivery>.from(
      response.data['content'].map(
        (model) => Delivery.fromJson(model),
      ),
    );
  }

  Future<Delivery> createDelivery(Delivery newDelivery) async {
    print(newDelivery.toJson());
    final response = await dio.post('entregas', data: newDelivery.toJson());

    return Delivery.fromJson(response.data);
  }

  Future<Delivery> fecthDelivery(int id) async {
    final response = await dio.get('entregas/$id');

    return Delivery.fromJson(response.data);
  }

  Future putStatus(int id, ShippingStatus status) async {
    final response = await dio.put(
      'entregas/$id/status',
      data: {"status": status.code},
    );

    return response;
  }
}
