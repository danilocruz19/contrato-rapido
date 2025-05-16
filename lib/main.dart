import 'package:contrato_rapido/home.dart';
import 'package:contrato_rapido/viewmodel/criar_contrato_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CriarContratoViewModel()),
      ],
      child: MyApp(),
    ),
  );
}
