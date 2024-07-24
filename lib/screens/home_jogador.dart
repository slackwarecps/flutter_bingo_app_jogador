import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class HomeJogadorScreen extends StatefulWidget {
  final User user;
  const HomeJogadorScreen({super.key, required this.user});

  @override
  State<HomeJogadorScreen> createState() => _HomeJogadorScreenState();
}

class _HomeJogadorScreenState extends State<HomeJogadorScreen> {
  final Logger logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Jogador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem vindo Jogador!',
            ),
            ElevatedButton(
              onPressed: (){
                button1Clicked();
              
              },
              child: const Text('Clique aqui'),
            ),
          ],
        ),
      ),
    );
  }

  void button1Clicked() {
     logger.i('button1:Clicou no botão');
     
  }
}