import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // conatrutor de widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 180, 231),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.nightlight),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 400,
              margin: EdgeInsets.all(20), // Margem externa de 20 pixels
              padding: EdgeInsets.all(10), // Espaçamento interno de 10 pixels
              child: ClipOval(
                  child: Image.asset(
                    "assets/img/image.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
            ),
            Text(
              "Exemplo de Texto",
              style: TextStyle(
                fontSize: 30, 
                color: const Color.fromARGB(255, 253, 180, 231),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Text(
              "Exemplo de Texto",
              style: TextStyle(
                fontSize: 18, 
                color: const Color.fromARGB(255, 241, 206, 165),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 500, margin: EdgeInsets.all(5), height: 80, color: const Color.fromARGB(255, 188, 225, 255), child: Text("OI"),),
                Container(width: 500, margin: EdgeInsets.all(5), height: 80, color: const Color.fromARGB(255, 196, 238, 197), child: Text("OI"),),
                Container(width: 500, margin: EdgeInsets.all(5), height: 80, color: const Color.fromARGB(255, 255, 202, 224), child: Text("OI"),),

                Container(width: 500, margin: EdgeInsets.all(0), height: 40, child: Row( 
                  children: [
                    Container (
                      width: 410, margin: EdgeInsets.all(0), height: 25, 
                      child: Text(
                      textAlign: TextAlign.left,
                      "Exemplo de Texto                           :",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        letterSpacing: 2,
                        wordSpacing: 2,
                        decoration: TextDecoration.underline,
                      ),),
                    ),
                    Container (
                      width: 50, margin: EdgeInsets.all(0), height: 35, 
                      child: 
                      IconButton(
                      icon: Icon(Icons.subdirectory_arrow_right),
                      onPressed: () {},
                    ),
                    ),
                ],
                ),
                ),
                Container(width: 500, margin: EdgeInsets.all(0), height: 40, child: Row( 
                  children: [
                    Container (
                      width: 410, margin: EdgeInsets.all(0), height: 25, 
                      child: Text(
                      textAlign: TextAlign.left,
                      "Exemplo de Texto                           :",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        letterSpacing: 2,
                        wordSpacing: 2,
                        decoration: TextDecoration.underline,
                      ),),
                    ),
                    Container (
                      width: 50, margin: EdgeInsets.all(0), height: 35, 
                      child: 
                      IconButton(
                      icon: Icon(Icons.subdirectory_arrow_right),
                      onPressed: () {},
                    ),
                    ),
                ],
                ),
                ),
                Container(width: 500, margin: EdgeInsets.all(0), height: 40, child: Row( 
                  children: [
                    Container (
                      width: 410, margin: EdgeInsets.all(0), height: 25, 
                      child: Text(
                      textAlign: TextAlign.left,
                      "Exemplo de Texto                           :",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        letterSpacing: 2,
                        wordSpacing: 2,
                        decoration: TextDecoration.underline,
                      ),),
                    ),
                    Container (
                      width: 50, margin: EdgeInsets.all(0), height: 35, 
                      child: 
                      IconButton(
                      icon: Icon(Icons.subdirectory_arrow_right),
                      onPressed: () {},
                    ),
                    ),
                ],
                ),
                ),
              ],
            )
            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),

    );
  }
}
