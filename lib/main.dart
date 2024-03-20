import 'package:flutter/material.dart';
import 'package:marcas/estado.dart';
import 'package:marcas/telas/produtos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EstadoApp(),
      child: MaterialApp(
        title: "Melhores Marcas",
        theme: ThemeData(
          colorScheme: const ColorScheme.light(),
          useMaterial3: true),
        home: const MyHomePage(),
      ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    estadoApp = context.watch<EstadoApp>(){

      Widget tela = const SizedBox.shrink();
        if (estadoApp.situacao == Situacao.mostrandoProdutos){
          tela = const Produtos();
        } else if (estadoApp.situacao == Situacao.mostrandoDetalhes) {
          tela = const Detalhes();
        }
        return tela;


      }
  }

