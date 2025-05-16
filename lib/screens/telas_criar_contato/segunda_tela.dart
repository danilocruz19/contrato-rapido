import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
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
            Text(
              'CONTRATADO(A) (Nome Completo/Razão Social, CPF/CNPJ e Endereço)',
            ),
            SizedBox(height: 10),
            TextField(
              controller: providerCriarContrato.controllerContratadoDescricao,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintMaxLines: 50,
                border: OutlineInputBorder(),
                hintText:
                    'Ex: Empresa ABC Ltda., inscrita no CNPJ sob n° 00.000.000/0001-00, com sede á Rua X n° 123, Cidade - UF',
              ),
            ),
            SizedBox(height: 30),
            Text(
              'CONTRATANTE(A) (Nome Completo/Razão Social, CPF/CNPJ e Endereço)',
            ),
            SizedBox(height: 10),
            TextField(
              controller: providerCriarContrato.controllerContratanteDescricao,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintMaxLines: 50,
                border: OutlineInputBorder(),
                hintText:
                    'Ex: João da Silva, brasileiro, portador do CPF n° 000.000.000-00, residente à Rua Y, n° 456, Cidade-UF',
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
                    if (providerCriarContrato.currentIndex == 1) {
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
                      if (providerCriarContrato.currentIndex == 1) {
                        providerCriarContrato.controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      }
                    });
                  },
                  child: Text('Próximo', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
