import 'package:bingojogador/screens/cartela/cartela_acoes.dart';
import 'package:bingojogador/screens/cartela/cartela_header.dart';
import 'package:bingojogador/screens/cartela/linha_cartela.dart';
import 'package:flutter/material.dart';


class Cartela extends StatelessWidget {
  const Cartela({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CartelaHeader(
          meu_local: "BAR DA FATIMA",
        ),
        Text("BINGO", style: Theme.of(context).textTheme.headlineLarge),
        LinhaCartela(),
        LinhaCartela(),
        LinhaCartela(),
        SizedBox(
          height: 40,
        ),
        CartelaAcoes()
      ],
    );
  }
}
