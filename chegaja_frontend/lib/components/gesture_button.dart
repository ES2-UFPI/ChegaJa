import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  const GestureButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);
  final String text;
  final Function onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color == null
                  ? const Color(0xFFF5F5F5)
                  : Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
