import 'package:chegaja_frontend/models/delivery/package.dart';

import '../utils/endpoint_utils.dart';

class PackageRepository {
  Future<List<Package>> fecthPackages() async {
    final packages = await dio.get('pacotes');

    return List<Package>.from(
      packages.data['content'].map(
        (model) => Package.fromJson(model),
      ),
    );
  }

  Future<Package> createPackage(Package newPackage) async {
    final response = await dio.post('pacotes', data: newPackage.toJson());

    return Package.fromJson(response.data);
  }
}
