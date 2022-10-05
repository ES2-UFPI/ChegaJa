import 'package:chegaja_frontend/models/delivery/delivery.dart';
import 'package:flutter/material.dart';

class DeliveryCard2 extends StatelessWidget {
  DeliveryCard2({Key? key, required this.delivery, this.changeStatus})
      : super(key: key);

  final Delivery delivery;
  Function? changeStatus;

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
        trailing: GestureDetector(
          onTap: () {
            if (changeStatus != null) {
              changeStatus!();
            }
          },
          child: Chip(
            backgroundColor: Theme.of(context).colorScheme.primary,
            avatar: CircleAvatar(
              backgroundColor: delivery.status?.color ?? Colors.black12,
            ),
            label: Text(delivery.status?.description ?? 'Sem status',
                style: const TextStyle(color: Color(0xFFF5F5F5))),
          ),
        ),
        title: Text(
          delivery.id.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: Text(
          '${delivery.peso} Kg',
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
