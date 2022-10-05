import 'package:chegaja_frontend/components/app_titles/app_bar_title.dart';
import 'package:chegaja_frontend/components/list_container.dart';
import 'package:chegaja_frontend/models/delivery/delivery.dart';
import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:flutter/material.dart';

import '../../components/cards/delivery_card.dart';
import '../../repository/delivery_repository.dart';

class PackagesDeliveryman extends StatefulWidget {
  const PackagesDeliveryman({Key? key}) : super(key: key);

  @override
  State<PackagesDeliveryman> createState() => _PackagesDeliverymanState();
}

class _PackagesDeliverymanState extends State<PackagesDeliveryman> {
  final deliveryRepository = DeliveryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarTitle(
            firstTitle: "Pacotes",
            secondTitle: "da entrega",
          ),
          ListContainer(
            title: "Pacotes",
            child: Column(
              children: [
                Delivery(
                  id: 1,
                  status: ShippingStatus.waiting,
                  peso: 10,
                ),
                Delivery(
                  id: 1,
                  status: ShippingStatus.waiting,
                  peso: 10,
                ),
                Delivery(
                  id: 1,
                  status: ShippingStatus.waiting,
                  peso: 10,
                ),
              ]
                  .map(
                    (e) => DeliveryCard(
                      delivery: e,
                      changeStatus: () {
                        changeStatus(e);
                      },
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  void changeStatus(Delivery delivery) {
    if (delivery.id != null && delivery.status != null) {
      deliveryRepository.putStatus(
        delivery.id!,
        delivery.status!,
        isEnterprise: true,
      );
    }
  }
}
