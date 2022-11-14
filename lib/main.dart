//Instância global GetIt
import 'package:flutter/material.dart';
import 'package:semana_api/app.dart';
import 'package:semana_api/shared/core/dependencies.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

