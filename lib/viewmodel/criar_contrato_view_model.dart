import 'package:contrato_rapido/models/contrato_model.dart';
import 'package:flutter/material.dart';

class CriarContratoViewModel extends ChangeNotifier {
  List<ContratoModel> quantidadeDeContratos = [];
  List<String> tipoDeContratoList = [
    'Prestação de serviços',
    'Aluguel',
    'Compra e Venda',
    'Trabalho',
  ];

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
}
