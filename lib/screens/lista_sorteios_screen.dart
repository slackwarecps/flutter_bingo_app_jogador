import 'package:flutter/material.dart';

class ListaSorteioScreen extends StatefulWidget {
  const ListaSorteioScreen({super.key});

  @override
  State<ListaSorteioScreen> createState() => _ListaSorteioScreenState();
}

class _ListaSorteioScreenState extends State<ListaSorteioScreen> {

  @override
  Widget build(BuildContext context) {
    // Add your widget tree here
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Bingos"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [  
           
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Sao Benedito '),
              subtitle:
                  Text('2 Cartelas'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          
               Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Sao Pedro '),
              subtitle:
                  Text('0 Cartelas'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          


               Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on, size: 42,),
              title: Text('Igreja Santa Isabel '),
              subtitle:
                  Text('Comprar Cartelas'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),

         
        ],
      ),
    );
  }
}