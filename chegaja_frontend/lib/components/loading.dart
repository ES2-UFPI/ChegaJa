import 'package:flutter/material.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) => const Center(child: CircularProgressIndicator())),
  );
}
