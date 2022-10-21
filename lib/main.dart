//Instância global GetIt
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:semana_api/app.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLibraries();
  runApp(const MyApp());
}

Future<void> setupLibraries() async {

  //Dependências
  
}
