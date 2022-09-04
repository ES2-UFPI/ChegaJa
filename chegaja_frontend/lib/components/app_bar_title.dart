import 'package:flutter/material.dart';

import 'title.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
  }) : super(key: key);

  final String firstTitle;
  final String secondTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.keyboard_backspace, size: 35),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        BuildTitle(
          firstTitle: firstTitle,
          secondTitle: secondTitle,
        ),
      ],
    );
  }
}
