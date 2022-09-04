import '../models/client/client.dart';
import '../utils/endpoint_utils.dart';

class ClientRepository {
  Future<List<Client>> fetchClients() async {
    final response = await dio.get('clientes');

    return List<Client>.from(
      response.data['content'].map(
        (model) => Client.fromJson(model),
      ),
    );
  }

  Future<Client> createClient(Client newClient) async {
    final response = await dio.post('clientes', data: newClient.toJson());

    return Client.fromJson(response.data);
  }

  Future<Client> fetchClient(int id) async {
    final response = await dio.get('clientes/$id');

    return Client.fromJson(response.data);
  }
}
