import 'package:chegaja_frontend/models/delivery/delivery.dart';
import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:chegaja_frontend/repository/delivery_repository.dart';
import 'package:chegaja_frontend/repository/package_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/app_titles/app_bar_title.dart';
import '../../components/cards/package_card.dart';
import '../../components/list_container.dart';
import '../../components/loading.dart';
import '../../models/delivery/package.dart';
import 'form_package.dart';

class PackagesList extends StatefulWidget {
  const PackagesList({Key? key}) : super(key: key);

  @override
  State<PackagesList> createState() => _PackagesListState();
}

class _PackagesListState extends State<PackagesList> {
  final int _idEmpresa = 1;

  final _deliveryRepository = DeliveryRepository();
  final _packageRepository = PackageRepository();
  final List<Package> _packages = [];

  // final packageRepository = PackageRepository();

  // bool _loading = true;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await reloadData();
  //   });
  //   super.initState();
  // }

  // Future<void> reloadData() async {
  //   if (!_loading) {
  //     setState(() {
  //       _loading = true;
  //     });
  //   }

  //   packages = await packageRepository.fecthPackages();
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarTitle(firstTitle: 'Solicite uma', secondTitle: 'entrega'),
          ListContainer(
            title: 'Pacotes',
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _packages.length,
              padding: const EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PackageCard(
                  clientName: _packages[index].clienteForm?.nome ?? 'sem nome',
                  wheigthPackage: _packages[index].peso.toString(),
                );
              },
            ),
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormPackage(),
                ),
              ).then(
                ((value) => _addPackage(value)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          loadingDialog(context);
          await _addPackages();
          if (!mounted) return;
          Navigator.pop(context);
          Navigator.pop(context);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.check),
      ),
    );
  }

  void _addPackage(Package? package) {
    if (package != null) {
      setState(() {
        _packages.add(package);
      });
    }
  }

  Future<Delivery> _createEntrega() async {
    double peso = 0;

    for (final i in _packages) {
      peso += i.peso ?? 0;
    }
    final a = DateFormat('y-M-dd').format(DateTime.now()).toString();
    print(a);
    final newDelivery = Delivery(
      data: a,
      status: ShippingStatus.waiting,
      valorTotal: 0,
      taxaServico: 0,
      peso: peso,
      idEmpresa: _idEmpresa,
      idEntregador: 0,
    );

    return await _deliveryRepository.createDelivery(newDelivery);
  }

  Future<void> _addPackages() async {
    final deliveries = await _createEntrega();

    for (final package in _packages) {
      package.idEntrega = deliveries.id;
      await _packageRepository.createPackage(package);
    }
  }
}
