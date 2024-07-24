import 'package:bingojogador/screens/cartela/cabecalho.dart';
import 'package:bingojogador/screens/cartela/tabela.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JogoSimplesScreen extends StatefulWidget {
  final User user;
  const JogoSimplesScreen({super.key, required this.user});

  @override
  State<JogoSimplesScreen> createState() => _JogoSimplesScreenState();
}

class _JogoSimplesScreenState extends State<JogoSimplesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo Simples"),
      ),
      body: Column(
        children: [
          Cabecalho(),
           Tabela(),
          Text.rich(
  TextSpan(
    text: 'App@',
    style: TextStyle(fontWeight: FontWeight.bold),
    children: <TextSpan>[
      TextSpan(
        text: ', BingoSolidario',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  ),
),
        ],
      ),
    );
  }
}