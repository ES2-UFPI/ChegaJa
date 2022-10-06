import 'package:chegaja_frontend/models/deliveryman/deliveryman.dart';
import 'package:chegaja_frontend/models/enterprise/enterprise.dart';
import 'package:chegaja_frontend/utils/endpoint_utils.dart';

class EnterpriseRepository {
  Future<Enterprise> createEnterprise(Enterprise newEnterprise) async {
    final response = await dio.post('empresa', data: newEnterprise.toJson());

    return Enterprise.fromJson(response.data);
  }

  Future<List<Deliveryman>> searchDeliverymans(
      double latitude, double longitude) async {
    final response = await dio.get("entregadores/proximos",
        queryParameters: {'latitude': latitude, 'longitude': longitude});

    return List<Deliveryman>.from(
      response.data['content'].map(
        (model) => Deliveryman.fromJson(model),
      ),
    );
  }
}
