import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // conatrutor de widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo Widget de Exibição")),
      body: Center(
        child: Column(
          children: [
            Text(
              "Exemplo de Texto",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              "Exemplo de Texto",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 2,
                decoration: TextDecoration.underline,
              ),
            ),
            Icon(Icons.star, size: 50, color: Colors.amber),
            IconButton(
              onPressed: () => print("Icone Pressionado"),
              icon: Icon(Icons.add_a_photo),
              iconSize: 50,
            ),
            Image.network(
              "https://m.media-amazon.com/images/I/51ErTu5TW2L._SY445_SX342_.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/img/image.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            // box de exibição de imagem
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/img/image.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/img/image.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
