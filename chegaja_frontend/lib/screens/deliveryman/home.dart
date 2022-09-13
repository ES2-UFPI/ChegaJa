import 'package:chegaja_frontend/components/app_titles/app_bar_title.dart';
import 'package:chegaja_frontend/components/avaliable_bar.dart';
import 'package:chegaja_frontend/components/delivery_card2.dart';
import 'package:chegaja_frontend/components/list_container.dart';
import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:flutter/material.dart';

class HomeDeliveryman extends StatefulWidget {
  const HomeDeliveryman({Key? key}) : super(key: key);

  @override
  State<HomeDeliveryman> createState() => _HomeDeliverymanState();
}

class _HomeDeliverymanState extends State<HomeDeliveryman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarTitle(
            firstTitle: 'Nome',
            secondTitle: 'do entregador',
            back: false,
          ),
          const SizedBox(
            height: 30,
          ),
          const AvaliableBar(),
          const SizedBox(
            height: 20,
          ),
          ListContainer(
            title: 'Pacotes',
            child: Column(
              children: const [
                DeliveryCard2(
                  wheigthPackage: '20',
                  deliveryNumber: '01234',
                  status: ShippingStatus.inProgress,
                ),
                DeliveryCard2(
                  wheigthPackage: '20',
                  deliveryNumber: '01234',
                  status: ShippingStatus.finished,
                ),
                DeliveryCard2(
                  wheigthPackage: '20',
                  deliveryNumber: '01234',
                  status: ShippingStatus.waiting,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
