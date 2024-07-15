import 'package:flutter/material.dart';

class Linha
 extends StatelessWidget {
  const Linha
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container( alignment: Alignment.center,  
             
               margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,
                child: Text("3", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
  
                ),
                Container( alignment: Alignment.center,   
                  margin: const EdgeInsets.all(10.0),
                color: Colors.green,
                width: 48.0,
                height: 48.0,
                child: Text("16", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.all( 5),
                
                ),
                Container( alignment: Alignment.center,   margin: const EdgeInsets.all(10.0),
                color:  Colors.white,
                width: 48.0,
                height: 48.0,child: Text("32", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                Container(alignment: Alignment.center,    margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,child: Text("46", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                Container( alignment: Alignment.center,   margin: const EdgeInsets.all(10.0),
                color:  Colors.white,
                width: 48.0,
                height: 48.0,child: Text("65", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
          ],
        );
  }
}