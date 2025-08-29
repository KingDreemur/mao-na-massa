import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/shared/widgets/templates/main_layout_template.dart';
import 'package:meu_projeto_integrador/shared/widgets/organisms/login_form_organism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLogged = false;

  void _handleLoginSuccess() {
    setState(() => _isLogged = true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Integrador',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _isLogged
          ? const MainLayoutTemplate(title: "Produtos")
          : Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: LoginFormOrganism(onLoginSuccess: _handleLoginSuccess),
                ),
              ),
            ),
    );
  }
}