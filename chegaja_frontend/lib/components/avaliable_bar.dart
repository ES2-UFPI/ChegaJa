import 'package:flutter/material.dart';

class AvaliableBar extends StatefulWidget {
  const AvaliableBar({Key? key}) : super(key: key);

  @override
  State<AvaliableBar> createState() => _AvaliableBarState();
}

class _AvaliableBarState extends State<AvaliableBar> {
  bool _light = false;

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
            onChanged: (bool value) {
              setState(() {
                _light = value;
              });
            },
          )
        ],
      ),
    );
  }
}
