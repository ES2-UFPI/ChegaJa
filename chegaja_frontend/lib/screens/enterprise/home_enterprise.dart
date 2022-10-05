import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:flutter/material.dart';

import '../../components/app_titles/app_bar_title.dart';
import '../../components/cards/delivery_card.dart';
import '../../components/list_container.dart';
import '../../models/delivery/delivery.dart';
import '../../repository/delivery_repository.dart';
import 'packages_list.dart';

class HomeEnterprise extends StatefulWidget {
  const HomeEnterprise({Key? key}) : super(key: key);

  @override
  State<HomeEnterprise> createState() => _HomeEnterpriseState();
}

class _HomeEnterpriseState extends State<HomeEnterprise> {
  List<Delivery> deliveries = [];

  final deliveryRepository = DeliveryRepository();

  bool _loading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await reloadData();
    });
    super.initState();
  }

  Future<void> reloadData() async {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }

    deliveries = await deliveryRepository.fetchDeliveries();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarTitle(
            firstTitle: "Home",
            secondTitle: "da empresa",
          ),
          ListContainer(
            title: "Entregas",
            action: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const PackagesList();
                  },
                ),
              );
              reloadData();
            },
            child: !_loading
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: deliveries.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print(deliveries[index].status);
                      return DeliveryCard(
                        delivery: deliveries[index],
                        changeStatus: () {
                          changeStatus(deliveries[index]);
                        },
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }

  void changeStatus(Delivery delivery) {
    if (delivery.id != null) {
      deliveryRepository.putStatus(
        delivery.id!,
        ShippingStatus.inProgress,
        isEnterprise: true,
      );
      reloadData();
    }
  }
}
