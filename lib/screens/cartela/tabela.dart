import 'package:bingo_jogador/screens/cartela/linha.dart';
import 'package:bingo_jogador/screens/cartela/linha_bingo.dart';
import 'package:flutter/material.dart';

class Tabela extends StatelessWidget {
  const Tabela({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
  
      children: [
     LinhaBingo(),
        Linha(),
         Linha(),
          Linha(),
    
      ],
    );
  }
}