import 'package:chegaja_frontend/screens/enterprise/form_package.dart';
import 'package:flutter/material.dart';

import '../../components/delivery_card.dart';
import '../../components/title.dart';
import '../../models/client/client.dart';
import '../../models/delivery/package.dart';

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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FormPackage(),
                                  ),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      widget.packages.add(value[2]);
                                      widget.clients.add(value[0]);
                                    });
                                  }
                                });
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
