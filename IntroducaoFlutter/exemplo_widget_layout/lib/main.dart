import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo de Lauout"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 188, 225, 255)),
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 196, 238, 197)),
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 255, 202, 224))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 196, 238, 197)),
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 255, 202, 224)),
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 188, 225, 255))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 255, 202, 224)),
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 188, 225, 255)),
              Container(width: 150, height: 150, color: const Color.fromARGB(255, 196, 238, 197))
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 150,height: 150, color: const Color.fromARGB(255, 196, 238, 197),),
                    Icon(Icons.person)
                  ],
                )
              ],
            )
        ],),
      ),
    );
  }
}