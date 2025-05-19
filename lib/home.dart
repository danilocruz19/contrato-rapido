import 'package:contrato_rapido/screens/home_app.dart';
import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final providerCriarContrato = Provider.of<CriarContratoViewModel>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      theme: providerCriarContrato.valorTema ? ThemeData.dark() : ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ) ,
      home: HomeApp()
    );
  }
}
