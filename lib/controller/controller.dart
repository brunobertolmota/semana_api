import 'dart:convert';
import 'dart:developer';

import 'package:semana_api/model/model.dart';
import 'package:semana_api/service/login_service.dart';
import 'package:semana_api/service/shared_preference.dart';
import 'package:semana_api/shared/error/errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller {
  final loginService = GetDataRepoService();

  final sharedService = SharedPreferenceTest();
  final String keyShared = 'apiList';

  List<ApitesteModel> onlineList = [];
  List<ApitesteModel> offlineList = [];

  Future<void> getDataController() async {
    try {
      onlineList = await loginService.getData();
      // log(onlineList.toString());
      // inspect(onlineList);
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
      final data =
          await loginService.postData(body: {'nome': nome, 'idade': idade});
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

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final cacheList = onlineList.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(keyShared, cacheList);
  }

  Future<List<ApitesteModel>> laodData() async {
    final prefs = await SharedPreferences.getInstance();
    final cacheList = prefs.getStringList(keyShared);
    if (cacheList != null) {
      offlineList =
          List<Map<String, dynamic>>.from(cacheList.map((e) => jsonDecode(e)))
              .map(ApitesteModel.fromJson)
              .toList();
    }
    return [];
  }

  textFieldValue(String value) {
    List<ApitesteModel> listFiltered = offlineList.where((e) => e.nome.toString().contains(value)).toList();
    inspect(listFiltered);
  }
}
