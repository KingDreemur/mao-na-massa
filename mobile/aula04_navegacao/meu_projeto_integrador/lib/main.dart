import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/screens/home_screen.dart';
import 'package:meu_projeto_integrador/screens/item_list_screen.dart'; // Importar a tela principal
// Importar a tela de detalhes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Integrador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ItemListScreen(), // A tela inicial do aplicativo
      // Exemplo de rotas nomeadas (opcional para essa aula, mas bom para referência futura)
      // routes: {
      //   '/details': (context) => const DetailScreen(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
