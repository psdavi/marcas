import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({super.key});

  @override
  State<StatefulWidget> createState(){
    return _DetalhesState();

  }
}

class _DetalhesState extends State<Detalhes>{
  @override
  Widget build(BuildContext context){
    return const Text("tela de detalhes de produtos");
  }
}