import 'package:flutter/material.dart';
import 'package:marcas/estado.dart';

class ProdutoCard extends StatelessWidget{
  final dynamic produto;
const ProdutoCard({super.key,
required this.produto});

@override
Widget build(BuildContext context){
  return GestureDetector(
    onTap: () {
      estadoApp.mostrarDetalhes();
    },
    child: Card(
      child: Column(
        children:[
          Image.asset("lib/recursos/imagens/produto.jpeg"),
          Row(children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset("lib/recursos/imagens/avatar.png")),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(produto["company"]["name"], 
              style: const TextStyle(fontSize: 17))),
          ]),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(produto["product"]["name"],
              style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)))
        ]),
    ),
  );
}
}