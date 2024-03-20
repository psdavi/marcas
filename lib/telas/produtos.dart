import 'dart:convert';
import 'package:flat_list/flat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marcas/componentes/produtocard.dart';
//statefull e stateless
//StatefulWidget componente que vai mudar durante o tempo

class Produtos extends StatefulWidget{
  const Produtos({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ProdutosState();
  }
}

  const int tamanhoPagina = 4;

class _ProdutosState extends State<Produtos>{
  late dynamic _feedEstatico;
  List<dynamic> _produtos = [];
  int _proximaPagina = 1;
  bool _carregando = false;

  @override
  void initState(){
    super.initState();
    _lerFeedEstatico();
  }

Future<void> _lerFeedEstatico() async {
  final String conteudoJson = 
  await rootBundle.loadString("lib/recursos/json/feed.json");
  _feedEstatico = await json.decode(conteudoJson);
  _carregarProdutos();

}
//gambiarra lazyload frontend pegando do json
void _carregarProdutos(){
  final totalProdutosParaCarregar = _proximaPagina * tamanhoPagina;
  var maisProdutos = _produtos;
  if (_feedEstatico["produtos"].length >= totalProdutosParaCarregar){
    maisProdutos =
    _feedEstatico["produtos"].sublist(0, totalProdutosParaCarregar);
  }

  setState((){
    _produtos = maisProdutos;
    _proximaPagina = _proximaPagina + 1;
    _carregando = false;
  });
}

Future<void> _atualizarProdutos() async {
  _produtos = [];
  _proximaPagina = 1;
  _carregarProdutos();
}

  @override
  Widget build(BuildContext context) {
    //return const Text("Lista de produtos aqui");
    return FlatList(
      data: _produtos,
      numColumns: 2,
      loading: _carregando,
      onRefresh: () => _atualizarProdutos(), 
      onEndReached: () => _carregarProdutos(),
      buildItem: (item, int indice){
return SizedBox(
  height:380,
  child: ProdutoCard(produto: item));
    });
    //return Text("${_produtos.length}");
  }
}