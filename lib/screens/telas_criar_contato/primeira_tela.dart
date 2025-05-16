import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
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
            Text('Título do Contrato'),
            TextField(
              controller: providerCriarContrato.controllerTitulo,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: Contrato de prestação de serviços',
              ),
            ),
            SizedBox(height: 20),
            Text('Tipo de contrato'),
            DropdownButton(
              isExpanded: true,
              hint: Text('Selecione um valor'),
              value: providerCriarContrato.valorSelecionado,
              items:
                  providerCriarContrato.tipoDeContratoList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                      onTap: () {
                        setState(() {
                          providerCriarContrato.valorSelecionado = item;
                        });
                      },
                    );
                  }).toList(),
              onChanged: (valorNovo) {
                setState(() {
                  providerCriarContrato.valorSelecionado = valorNovo!;
                });
              },
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromARGB(255, 48, 96, 136),
                ),
                onPressed: () {
                  setState(() {
                    if (providerCriarContrato.currentIndex == 0) {
                      providerCriarContrato.controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  });
                  print('object');
                },
                child: Text('Próximo', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
