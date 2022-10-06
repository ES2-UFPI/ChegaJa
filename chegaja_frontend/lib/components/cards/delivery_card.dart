import 'package:chegaja_frontend/models/delivery/delivery.dart';
import 'package:chegaja_frontend/screens/enterprise/maps_delivery.dart';
import 'package:flutter/material.dart';

class DeliveryCard extends StatefulWidget {
  const DeliveryCard(
      {Key? key,
      required this.delivery,
      this.changeStatus,
      required this.isEnterprise})
      : super(key: key);

  final Delivery delivery;
  final Function? changeStatus;
  final bool isEnterprise;

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
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
        leading: widget.isEnterprise
            ? IconButton(
                icon: const Icon(Icons.location_on),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const MapsDelivery();
                      },
                    ),
                  );
                },
              )
            : null,
        trailing: GestureDetector(
          onTap: () {
            if (widget.changeStatus != null) {
              widget.changeStatus!();
            }
          },
          child: Chip(
            backgroundColor: Theme.of(context).colorScheme.primary,
            avatar: CircleAvatar(
              backgroundColor: widget.delivery.status?.color ?? Colors.black12,
            ),
            label: Text(widget.delivery.status?.description ?? 'Sem status',
                style: const TextStyle(color: Color(0xFFF5F5F5))),
          ),
        ),
        title: Text(
          widget.delivery.id.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: Text(
          '${widget.delivery.peso} Kg',
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
