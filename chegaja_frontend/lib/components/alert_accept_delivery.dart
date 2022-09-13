import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Nova entrega'),
          content: const Text('Você tem uma nova requisição de entrega!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'rejeitou'),
              child: const Text('Rejeitar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'aceitou'),
              child: const Text('Aceitar'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
