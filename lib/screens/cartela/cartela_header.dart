import 'package:flutter/material.dart';

class CartelaHeader extends StatelessWidget {
  final String meu_local;
  const CartelaHeader({super.key, this.meu_local = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimeiraLinha(
          meu_local: meu_local,
        ),
        TerceiraLinha()
      ],
    );
  }
}

class PrimeiraLinha extends StatelessWidget {
  final String meu_local;
  const PrimeiraLinha({super.key, this.meu_local = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          meu_local,
          style: TextStyle(fontSize: 21),
        ),
      ],
    );
  }
}

class TerceiraLinha extends StatelessWidget {
  const TerceiraLinha({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Text("20/04/1979"),
        // Text("0000007"),
        // Text("167"),
        Card(
          child: _SampleCard(
            titulo: "DATA",
            valor: "20/04/1979",
          ),
        ),
        Card(
          child: _SampleCard(
            titulo: "No.",
            valor: "0000055",
          ),
        ),
        Card(
          child: _SampleCard(
            titulo: "Rodada",
            valor: "20/04/1979",
          ),
        ),
      ],
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.titulo, required this.valor});
  final String titulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Column(children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(valor)
      ]),
    );
  }
}
