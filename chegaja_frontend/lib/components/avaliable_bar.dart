import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../repository/deliveryman_repository.dart';

class AvaliableBar extends StatefulWidget {
  const AvaliableBar({Key? key}) : super(key: key);

  @override
  State<AvaliableBar> createState() => _AvaliableBarState();
}

class _AvaliableBarState extends State<AvaliableBar> {
  bool _light = false;
  final Location location = Location();
  StreamSubscription<LocationData>? subscription;
  final deliverymanRepository = DeliverymanRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      height: 60,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _light
            ? Theme.of(context).colorScheme.primary
            : const Color(0xFFF5F5F5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            // spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _light ? 'Estou disponível' : 'Estou indisponível',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _light
                  ? const Color(0xFFF5F5F5)
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
          Switch(
            value: _light,
            activeColor: _light
                ? const Color(0xFFF5F5F5)
                : Theme.of(context).colorScheme.primary,
            onChanged: changeAvailability,
          )
        ],
      ),
    );
  }

  Future<void> changeAvailability(bool value) async {
    setState(() {
      _light = value;
    });

    if (value) {
      await location.getLocation();
      subscription = location.onLocationChanged.listen((event) {
        print([event.latitude, event.longitude]);
        if (event.latitude != null && event.longitude != null) {
          deliverymanRepository.putLocation(
              1, event.latitude!, event.longitude!);
        }
      });
    } else {
      print('cancel');
      subscription?.cancel();
    }
  }
}
