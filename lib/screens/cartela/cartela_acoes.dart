import 'package:flutter/material.dart';

class CartelaAcoes extends StatelessWidget {
  const CartelaAcoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("BINGO")),
          ElevatedButton(onPressed: () {}, child: const Text("Vai logo")),
          ElevatedButton(onPressed: () {}, child: const Text("Manda Boa"))
        ],
      ),
    );
  }
}
