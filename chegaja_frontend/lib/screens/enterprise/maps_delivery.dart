import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsDelivery extends StatefulWidget {
  const MapsDelivery({Key? key}) : super(key: key);

  @override
  State<MapsDelivery> createState() => _MapsDeliveryState();
}

class _MapsDeliveryState extends State<MapsDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rastreio de entrega"),
      ),
      body: GoogleMap(
        // [-5.05610622268097,-42.79059631958071]
        initialCameraPosition: const CameraPosition(
          target: LatLng(-5.05610622268097, -42.79059631958071),
          zoom: 17,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('Teste'),
            position: LatLng(-5.05610622268097, -42.79059631958071),
          )
        },
      ),
    );
  }
}
