import 'package:contrato_rapido/screens/telas_criar_contato/primeira_tela.dart';
import 'package:contrato_rapido/screens/telas_criar_contato/segunda_tela.dart';
import 'package:contrato_rapido/screens/telas_criar_contato/terceira_tela.dart';
import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CriarContrato extends StatefulWidget {
  const CriarContrato({super.key});

  @override
  State<CriarContrato> createState() => _CriarContratoState();
}

class _CriarContratoState extends State<CriarContrato> {
  @override
  Widget build(BuildContext context) {
    final providerCriarContrato = Provider.of<CriarContratoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar Novo Contrato',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 10,
                child: SizedBox(
                  width: 350,
                  height: 500,
                  child: PageView(
                    controller: providerCriarContrato.controller,
                    onPageChanged: (index) {
                      providerCriarContrato.currentIndex = index;
                    },
                    children: [PrimeiraTela(), SegundaTela(), TerceiraTela()],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SmoothPageIndicator(
              controller: providerCriarContrato.controller,
              count: 3,
              effect: WormEffect(
                dotHeight: 20,
                dotWidth: 20,
                dotColor: const Color.fromARGB(255, 206, 205, 205),
                activeDotColor: Color.fromARGB(255, 48, 96, 136),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
