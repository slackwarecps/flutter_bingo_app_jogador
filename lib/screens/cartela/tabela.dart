import 'package:bingo_jogador/screens/linha.dart';
import 'package:flutter/material.dart';

class Tabela extends StatelessWidget {
  const Tabela({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
  
      children: [
     
        Linha(),
         Linha(),
          Linha(),
    
      ],
    );
  }
}