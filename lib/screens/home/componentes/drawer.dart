import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text('Menu Jogador'),
          ),
          ListTile(
            title: const Text('Jogo Simples'),
            onTap: () {
              Navigator.pushNamed(context, '/jogo_simples');
            },
          ),
          ListTile(
            title: const Text('Jogo Completo'),
            onTap: () {
              Navigator.pushNamed(context, '/jogo_completo');
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              //FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}