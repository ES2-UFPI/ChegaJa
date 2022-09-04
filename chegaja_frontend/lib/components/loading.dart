import 'package:flutter/material.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: ((context) => const Center(child: CircularProgressIndicator())),
  );
}
