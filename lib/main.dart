//Instância global GetIt
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:semana_api/app.dart';
import 'package:semana_api/shared/core/dependencies.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLibraries();
  runApp(const MyApp());
}

Future<void> setupLibraries() async {

  //Dependências
  initializeDependencies();
  
}
