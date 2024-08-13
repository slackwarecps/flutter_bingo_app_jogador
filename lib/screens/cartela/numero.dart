import 'package:flutter/material.dart';

class Numero extends StatelessWidget {
  const Numero({super.key, required this.numero});
  final String numero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 70,
        decoration: BoxDecoration(border: Border.all()),
        padding: const EdgeInsets.all(8.0),
        child: Text(numero, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
