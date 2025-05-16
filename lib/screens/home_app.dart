import 'package:contrato_rapido/screens/criar_contrato.dart';
import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    final providerCriarContrato = Provider.of<CriarContratoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ContratoRápido',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 48, 96, 136),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(title: Text('Visualizar contratos'));
                },
              );
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(255, 216, 215, 215),
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 400,
            height: 100,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total de Contratos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${providerCriarContrato.quantidadeDeContratos.length}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 48, 96, 136),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contratos Recentes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CriarContrato()),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 48, 96, 136),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  '+ Novo Contrato',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          providerCriarContrato.quantidadeDeContratos.isEmpty
              ? Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 185, 210, 230),
                          child: Icon(
                            Icons.paste,
                            color: Color.fromARGB(255, 48, 96, 136),
                          ),
                        ),
                        Text(
                          'Nenhum contrato criado',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Você ainda não criou nenhum contrato. Que tal começar agora',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 95, 94, 94),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 48, 96, 136),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Criar contrato',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              : Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final listaDeContratos =
                        providerCriarContrato.quantidadeDeContratos[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  listaDeContratos.tituloDoContrato,
                                  style: TextStyle(fontSize: 20),
                                ),
                                content: SizedBox(
                                  width: 500,
                                  height: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dados do contratado',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        listaDeContratos.contratadoDescricao,
                                      ),
                                      SizedBox(height: 40),
                                      Text(
                                        'Dados do contratante',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        listaDeContratos.contratanteDescricao,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Card(
                          elevation: 10,
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listaDeContratos.tituloDoContrato,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(listaDeContratos.tipoDeContrato),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: providerCriarContrato.quantidadeDeContratos.length,
                ),
              ),
        ],
      ),
    );
  }
}
