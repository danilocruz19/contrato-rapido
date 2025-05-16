import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart'
    show CriarContratoViewModel;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key});

  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  @override
  Widget build(BuildContext context) {
    final providerCriarContrato = Provider.of<CriarContratoViewModel>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descrição do Serviço'),
            SizedBox(height: 10),
            TextField(
              controller: providerCriarContrato.controllerDescricaoDoServico,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintMaxLines: 50,
                border: OutlineInputBorder(),
                hintText: 'Descreva os serviços a serem prestados...',
              ),
            ),
            SizedBox(height: 30),
            Text('Valor do contrato (R\$)'),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintMaxLines: 50,
                border: OutlineInputBorder(),
                hintText: '0,00',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (providerCriarContrato.currentIndex == 2) {
                      setState(() {
                        providerCriarContrato.controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    }
                  },
                  child: Text('Voltar', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 48, 96, 136),
                  ),
                  onPressed: () {
                    setState(() {
                      providerCriarContrato.adicionarContrato();
                      Navigator.pop(context);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Contrato adicionado'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Text(
                    'Gerar Contrato',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
