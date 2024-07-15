import 'package:flutter/material.dart';

class Cabecalho extends StatelessWidget {
  const Cabecalho({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.green],
        ),
        color: Colors.blue,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(

      children: [
        Text("PAROQUIA SÃO PEDRO APOSTOLO CAMPINAS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("DATA: 20/02/2022",style: TextStyle(fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("N: 0148",style: TextStyle(fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("RODADA: 2525",style: TextStyle(fontSize: 18),),
            ),
          ],
        ),


      ],
    ));
  }
}