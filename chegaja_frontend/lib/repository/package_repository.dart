import 'package:chegaja_frontend/models/delivery/package.dart';

import '../utils/endpoint_utils.dart';

class PackageRepository {
  Future<List<Package>> fecthPackages() async {
    final response = await dio.get('pacotes');

    return List<Package>.from(
      response.data['content'].map(
        (model) => Package.fromJson(model),
      ),
    );
  }

  Future<Package> createPackage(Package newPackage) async {
    final response = await dio.post('pacotes', data: newPackage.toJson());

    return Package.fromJson(response.data);
  }

  Future<Package> fetchPackage(int id) async {
    final response = await dio.get('pacotes/$id');

    return Package.fromJson(response.data);
  }
}
