import 'package:flutter/material.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
  }) : super(key: key);

  final String firstTitle;
  final String secondTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 30, 0, 0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              secondTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ]),
    );
  }
}
