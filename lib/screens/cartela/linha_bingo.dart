import 'package:flutter/material.dart';

class LinhaBingo extends StatelessWidget {
  const LinhaBingo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container( 
              alignment: Alignment.center,
              
               margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Text("B", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
               ),
                ),
                Container(
                   alignment: Alignment.center,  
                  margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,
                child: Text("I", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.all( 5),
                
                ),
                Container(
                  
                   alignment: Alignment.center,
                     margin: const EdgeInsets.all(10.0),
                color:  Colors.white,
                width: 48.0,
                height: 48.0,
                child: Text("N", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                Container
                ( alignment: Alignment.center,  margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: 48.0,
                height: 48.0,
                child: Text("G", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                Container(  
                   alignment: Alignment.center,
                   margin: const EdgeInsets.all(10.0),
                color:  Colors.white,
                width: 48.0,
                height: 48.0,
                child: Text("O", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
          ],
        );
  }
}