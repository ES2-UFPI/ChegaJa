import 'package:chegaja_frontend/components/app_titles/app_bar_title.dart';
import 'package:chegaja_frontend/components/avaliable_bar.dart';
import 'package:chegaja_frontend/components/list_container.dart';
import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:flutter/material.dart';

import '../../components/cards/delivery_card.dart';
import '../../models/delivery/delivery.dart';
import '../../repository/delivery_repository.dart';

class HomeDeliveryman extends StatefulWidget {
  const HomeDeliveryman({Key? key}) : super(key: key);

  @override
  State<HomeDeliveryman> createState() => _HomeDeliverymanState();
}

class _HomeDeliverymanState extends State<HomeDeliveryman> {
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

    deliveries = await deliveryRepository.fetchDeliveriesById(1, false);
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
            firstTitle: 'Suas',
            secondTitle: 'entregas',
            // back: false,
          ),
          const SizedBox(
            height: 30,
          ),
          const AvaliableBar(),
          const SizedBox(
            height: 20,
          ),
          ListContainer(
            title: 'Entregas',
            child: !_loading
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: deliveries.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return DeliveryCard(
                        delivery: deliveries[index],
                        changeStatus: () {
                          changeStatus(deliveries[index]);
                        },
                        isEnterprise: false,
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> changeStatus(Delivery delivery) async {
    if (delivery.id != null && delivery.status == ShippingStatus.inProgress) {
      setState(() {
        _loading = true;
      });
      await deliveryRepository.putStatus(
        delivery.id!,
        ShippingStatus.finished,
      );
      reloadData();
    }
  }
}
