import 'package:flutter/material.dart';

// Widget riutilizzabile che mostra i due pulsanti + e - affiancati.
// Riceve le callback dall'esterno: non gestisce stato, sa solo cosa fare al click.
class CounterButtons extends StatelessWidget {
  const CounterButtons({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  // Callback passate dal genitore: vengono chiamate al click dei rispettivi pulsanti
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: onDecrement,
          tooltip: 'Riduci',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: onIncrement,
          tooltip: 'Incrementa',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
