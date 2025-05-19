import 'dart:convert';

import 'package:contrato_rapido/models/contrato_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CriarContratoViewModel extends ChangeNotifier {
  List<ContratoModel> quantidadeDeContratos = [];
  List<String> tipoDeContratoList = [
    'Prestação de serviços',
    'Aluguel',
    'Compra e Venda',
    'Trabalho',
  ];

  bool valorTema = false;
  void mudarTema(bool valorNovo) {
    valorTema = valorNovo;
    notifyListeners();
  }

  String? valorSelecionado;

  String tituloDoContrato = '';
  String tipoDeContrato = '';
  String contratadoDescricao = '';
  String contratanteDescricao = '';
  String descricaoDoServico = '';
  String valorDoContrato = '';

  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerContratadoDescricao = TextEditingController();
  TextEditingController controllerContratanteDescricao =
      TextEditingController();
  TextEditingController controllerDescricaoDoServico = TextEditingController();

  void adicionarContrato() {
    quantidadeDeContratos.add(
      ContratoModel(
        tituloDoContrato: controllerTitulo.text,
        tipoDeContrato: valorSelecionado!,
        contratadoDescricao: controllerContratadoDescricao.text,
        contratanteDescricao: controllerContratanteDescricao.text,
        descricaoDoServico: controllerDescricaoDoServico.text,
        valorDoContrato: '1200',
      ),
    );
    controllerTitulo.clear();
    controllerContratadoDescricao.clear();
    controllerContratanteDescricao.clear();
    controllerDescricaoDoServico.clear();
    valorSelecionado = 'Prestação de serviços';
    currentIndex = 0;
    notifyListeners();
  }

  final PageController controller = PageController();
  int currentIndex = 0;

  List<String> estados = [];
  String estadoSelecionado = '';
  Future<void> consumirApi() async {
    final url = Uri.parse(
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dadosApi = jsonDecode(response.body);
      estados = List.from(dadosApi.map((estado) => estado['sigla']));
      estados.sort();
      notifyListeners();
    } else {
      throw Exception('Erro ao consumir api');
    }
    ;
  }
}
