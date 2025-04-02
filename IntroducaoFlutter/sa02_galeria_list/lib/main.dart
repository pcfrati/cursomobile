import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ListApp()));
}

class ListApp extends StatefulWidget {
  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  final TextEditingController _imagemController = TextEditingController();
  List<Map<String, dynamic>> _imagens = []; // Lista de imagens com título e URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeria de Imagens"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _imagemController,
              decoration: InputDecoration(labelText: "Insira a URL da imagem"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _adicionarImagem,
                child: Text("Adicionar Imagem")),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _imagens.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _imagens[index]["titulo"],
                    style: TextStyle(
                      decoration: _imagens[index]["concluida"]
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
              ),
              items: _imagens.map((imagem) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(imagem["url"], fit: BoxFit.cover),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemCount: _imagens.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _mostrarImagem(context, _imagens[index]["url"]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(_imagens[index]["url"],
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _adicionarImagem() {
    if (_imagemController.text.trim().isNotEmpty) {
      setState(() {
        _imagens.add({
          "titulo": "Imagem ${_imagens.length + 1}",
          "url": _imagemController.text.trim(),
          "concluida": false
        });
        _imagemController.clear();
      });
    }
  }

  void _mostrarImagem(BuildContext context, String imagem) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(imagem),
      ),
    );
  }
}
