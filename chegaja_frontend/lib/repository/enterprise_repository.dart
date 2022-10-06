import 'package:chegaja_frontend/models/enterprise/enterprise.dart';
import 'package:chegaja_frontend/utils/endpoint_utils.dart';

class EnterpriseRepository {
  Future<Enterprise> createEnterprise(Enterprise newEnterprise) async {
    final response = await dio.post('empresa', data: newEnterprise.toJson());

    return Enterprise.fromJson(response.data);
  }
}
