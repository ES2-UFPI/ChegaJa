import '../models/client/client.dart';
import '../utils/endpoint_utils.dart';

class ClientRepository {
  Future<List<Client>> fetchClient() async {
    final clients = await dio.get('clientes');

    return List<Client>.from(
      clients.data['content'].map(
        (model) => Client.fromJson(model),
      ),
    );
  }

  Future<Client> createClient(Client newClient) async {
    final response = await dio.post('clientes', data: newClient.toJson());

    return Client.fromJson(response.data);
  }
}
