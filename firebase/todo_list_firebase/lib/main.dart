import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/firebase_options.dart';
import 'package:todo_list_firebase/views/auth_widget.dart';

//
void main() async {
  // vai concectar com o firebase
  //garatir o carregamento primeiro das bindings
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MaterialApp(
    title: "Lista de Tarefas Firebase",
    home: AuthWidget(),
  ));
}
