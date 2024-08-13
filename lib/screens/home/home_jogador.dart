import 'package:bingojogador/screens/home/componentes/card_home.dart';
import 'package:bingojogador/screens/home/componentes/drawer.dart';
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
      drawer: HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Home Jogador'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             HomeCard(tituloDoCard: "Comprar Cartelas"),
                 HomeCard(tituloDoCard: "Meus Bingos"),
            ],
            
          )
        ],
      )
    );
  }

  void button1Clicked() {
     logger.i('button1:Clicou no botão');
     enviaToken('ola token');

  }

  void enviaToken(String? token) {
     logger.i('>> enviaToken');


  }
}



