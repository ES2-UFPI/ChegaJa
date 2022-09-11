import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationDeliveryman extends StatefulWidget {
  const LocationDeliveryman({Key? key}) : super(key: key);

  @override
  State<LocationDeliveryman> createState() => _LocationDeliverymanState();
}

class _LocationDeliverymanState extends State<LocationDeliveryman> {
  final Location location = Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Deliveryman"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final locationResult = await location.getLocation();
              print(locationResult);
              location.onLocationChanged.listen((event) {
                print([event.latitude, event.longitude]);
              });
            },
            child: const Text("Test")),
      ),
    );
  }
}
