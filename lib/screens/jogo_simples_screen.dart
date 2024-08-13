
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
      body: Text("jogo simples")
    );
  }
}