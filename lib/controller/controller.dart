import 'dart:developer';

import 'package:semana_api/service/service.dart';
import 'package:semana_api/shared/error/errors.dart';

class Controller {
  final service = GetDataRepoService();

  Future<void> getDataController() async {
    try {
      final data = await service.getData();
      log(data.toString());
      inspect(data);
    } on ForbiddenException {
      //msg de erro
    } on NotFoundException {
      //msg de erro
    } on InternalServerException {
      //msg de erro
    } on UnknownEception {
      //msg de erro
    } finally {
      //carregamento finalizado
    }
  }


  Future<void> postDataController(String nome, int idade) async {
    try {
      final data = await service.postData({'nome': nome, 'idade': idade});
      log(data.toString());
      inspect(data);
    } on ForbiddenException {
      //msg de erro
    } on NotFoundException {
      //msg de erro
    } on InternalServerException {
      //msg de erro
    } on UnknownEception {
      //msg de erro
    } finally {
      //carregamento finalizado
    }
  }
}
