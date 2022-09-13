import 'package:chegaja_frontend/components/app_titles/app_bar_title.dart';
import 'package:chegaja_frontend/components/delivery_card2.dart';
import 'package:chegaja_frontend/components/list_container.dart';
import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:flutter/material.dart';

class PackagesDeliveryman extends StatefulWidget {
  const PackagesDeliveryman({Key? key}) : super(key: key);

  @override
  State<PackagesDeliveryman> createState() => _PackagesDeliverymanState();
}

class _PackagesDeliverymanState extends State<PackagesDeliveryman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarTitle(
            firstTitle: "Pacotes",
            secondTitle: "da entrega",
          ),
          ListContainer(
            child: Column(
              children: [
                DeliveryCard2(
                  wheigthPackage: "peso",
                  deliveryNumber: "Nome",
                  status: ShippingStatus.inProgress,
                ),
                DeliveryCard2(
                  wheigthPackage: "peso",
                  deliveryNumber: "Nome",
                  status: ShippingStatus.finished,
                ),
                DeliveryCard2(
                  wheigthPackage: "peso",
                  deliveryNumber: "Nome",
                  status: ShippingStatus.waiting,
                ),
              ],
            ),
            title: "Pacotes",
          )
        ],
      ),
    );
  }
}
