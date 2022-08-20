import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    Key? key,
    required this.clientName,
    required this.wheigthPackage,
  }) : super(key: key);

  final String clientName;
  final String wheigthPackage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ListTile(
        trailing: const Icon(
          Icons.remove_circle,
          color: Color(0xFF262626),
        ),
        title: Text(
          clientName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: Text(
          wheigthPackage,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF262626),
          ),
        ),
      ),
    );
  }
}
