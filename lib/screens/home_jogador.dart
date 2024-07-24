import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeJogadorScreen extends StatefulWidget {
  final User user;
  const HomeJogadorScreen({super.key, required this.user});

  @override
  State<HomeJogadorScreen> createState() => _HomeJogadorScreenState();
}

class _HomeJogadorScreenState extends State<HomeJogadorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Jogador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Bem vindo Jogador!',
            ),
          ],
        ),
      ),
    );
  }
}