import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:semana_api/model/model.dart';
import 'package:semana_api/service/login_service.dart';
import 'package:semana_api/service/shared_preference.dart';
import 'package:semana_api/shared/error/errors.dart';

class Controller {
  //get it da service
  final SharedPreferenceTestImpl localStorageService;
  final GetDataRepoService remoteService;
  final String keyShared = 'apiList';

  Controller({
    required this.localStorageService,
    required this.remoteService,
  });

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();

  List<ApitesteModel> onlineList = [];
  List<ApitesteModel> offlineList = [];

  Future<void> getDataController() async {
    try {
      onlineList = await remoteService.getData();
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
          await remoteService.postData(body: {'nome': nome, 'idade': idade});
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
    // final prefs = await SharedPreferences.getInstance();
    final cacheList = onlineList.map((e) => jsonEncode(e.toJson())).toList();
    await localStorageService.writeData(
      key: keyShared,
      list: cacheList,
    );
  }

  Future<List<ApitesteModel>> loadData() async {
    // final prefs = await SharedPreferences.getInstance();
    final cacheList = await localStorageService.readData(key: keyShared);
    if (cacheList != null) {
      offlineList =
          List<Map<String, dynamic>>.from(cacheList.map((e) => jsonDecode(e)))
              .map(ApitesteModel.fromJson)
              .toList();
      // fazendo o sort por idade
      // offlineList.sort(((a, b) => a.idade!.compareTo(b.idade!)));
    }
    return [];
  }

  textFilterName(String value) {
    List<ApitesteModel> listFiltered =
        offlineList.where((e) => e.nome.toString().contains(value)).toList();
    inspect(listFiltered);
  }

  textFilterAge(String value) {
    List<ApitesteModel> listFiltered =
        offlineList.where((e) => e.idade.toString().contains(value)).toList();
    inspect(listFiltered);
  }

  // filtrando por nome e idade
  textFilterNameAndAge(String name, String age) {
    List<ApitesteModel> listFiltered = offlineList
        .where((e) => e.idade.toString() == age && e.nome == name)
        .toList();
    inspect(listFiltered);
  }
}
