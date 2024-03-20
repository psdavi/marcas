import 'package:flutter/material.dart';

enum Situacao { mostrandoProdutos, mostrandoDetalhes }

class EstadoApp extends ChangeNotifier{
  Situacao _situacao = Situacao.mostrandoProdutos;
  Situacao get situacao => _situacao;

  void mostrarProdutos(){
    _situacao = Situacao.mostrandoProdutos;
    notifyListeners();
  }

  void mostrarDetalhes(){
    _situacao = Situacao.mostrandoDetalhes;
    notifyListeners();
  }
}

late EstadoApp estadoApp;