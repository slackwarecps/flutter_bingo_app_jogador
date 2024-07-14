import 'package:flutter/material.dart';

class Linha
 extends StatelessWidget {
  const Linha
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container( 
             
               margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,
                child: Text("3"),
                ),
                Container(  
                  margin: const EdgeInsets.all(10.0),
                color: Colors.green,
                width: 48.0,
                height: 48.0,
                child: Text("16", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.all( 5),
                
                ),
                Container(  margin: const EdgeInsets.all(10.0),
                color:  Colors.white,
                width: 48.0,
                height: 48.0,child: Text("32"),
                ),
                Container(  margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,child: Text("46"),
                ),
                Container(  margin: const EdgeInsets.all(10.0),
                color:  Colors.white,
                width: 48.0,
                height: 48.0,child: Text("65"),
                ),
          ],
        );
  }
}