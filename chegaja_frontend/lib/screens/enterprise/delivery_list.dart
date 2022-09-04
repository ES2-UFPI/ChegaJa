import 'package:flutter/material.dart';

import '../../components/delivery_card.dart';
import '../../components/title.dart';
import '../../models/client/client.dart';
import '../../models/delivery/package.dart';
import '../../models/deliveryman/deliveryman.dart';
import '../../repository/deliveryman_repository.dart';

class DeliveryList extends StatefulWidget {
  DeliveryList({Key? key}) : super(key: key);

  final List<Client> clients = [];
  final List<Package> packages = [];

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: IconButton(
                  icon: const Icon(Icons.keyboard_backspace, size: 35),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
              const BuildTitle(
                firstTitle: 'Solicite uma',
                secondTitle: 'entrega',
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      // spreadRadius: 5,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pacotes',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF262626),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.add, size: 35),
                              color: const Color(0xFFE30B86),
                              onPressed: () async {
                                final deliverymanRepo = DeliverymanRepository();
                                final deliveryman = Deliveryman(
                                  nome: "string",
                                  cpf: "string",
                                  pesoMaximo: 0,
                                );

                                print(await deliverymanRepo
                                    .createDeliveryman(deliveryman));
                                // final enterpriseRepo = EnterpriseRepository();
                                // final enterprise = Enterprise(
                                //   email: "string",
                                //   senha: "string",
                                //   telefone: "string",
                                //   cnpj: "string",
                                //   nome: "string",
                                // );

                                // print(await enterpriseRepo
                                //     .createEnterprise(enterprise));

                                // final packageRepo = PackageRepository();

                                // final package = Package(
                                //   descricao: "string",
                                //   codigoConfirmacao: "string",
                                //   status: "EM_ANDAMENTO",
                                //   idCliente: 1,
                                //   peso: 0,
                                // );

                                // print(await packageRepo.createPackage(package));
                                // print("-----");
                                // print(await packageRepo.fecthPackages());

                                // final clientRepo = ClientRepository();
                                // final addressRepo = AddressRepository();

                                // final client = Client(
                                //   nome: 'Jorge',
                                //   contato: '999999999',
                                //   idEndereco: 1,
                                // );

                                // String? bairro,
                                // String? logradouro,
                                // String? complemento,
                                // String? cep,
                                // String? longitude,
                                // String? latitude,
                                // String? uf,
                                // String? numero,
                                // final address = Address(
                                //   bairro: "string",
                                //   logradouro: "string",
                                //   complemento: "string",
                                //   cep: "string",
                                //   longitude: "string",
                                //   latitude: "string",
                                //   uf: "string",
                                //   numero: "string",
                                // );
                                // print(await addressRepo.createAddress(address));
                                // print('---------------');
                                // print(await addressRepo.fetchAddress());

                                // clientRepo.createClient(client);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const FormPackage(),
                                //   ),
                                // ).then((value) {
                                //   if (value != null) {
                                //     setState(() {
                                //       widget.packages.add(value[2]);
                                //       widget.clients.add(value[0]);
                                //     });
                                //   }
                                // });
                              })
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.clients.length,
                        padding: const EdgeInsets.only(bottom: 20),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DeliveryCard(
                            clientName: widget.clients[index].nome!,
                            wheigthPackage:
                                widget.packages[index].peso.toString(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.check),
      ),
    );
  }
}
