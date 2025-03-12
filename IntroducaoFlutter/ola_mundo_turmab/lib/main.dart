import 'package:flutter/material.dart';

void main(){   // roda a aplicação
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu primeiro APP"),
        ),
        body: Center(
          child:Text("Olá, Mundo!!!")
        )
      )
    );
  }
}