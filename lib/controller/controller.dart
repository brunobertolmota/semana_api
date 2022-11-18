import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:semana_api/model/model.dart';
import 'package:semana_api/service/login_service.dart';
import 'package:semana_api/shared/client/cache_client.dart';
import 'package:semana_api/shared/error/errors.dart';

class Controller extends ChangeNotifier {
  //get it da service
  final CacheStore localStorageService;
  final GetDataRepoService remoteService;
  final String keyShared = 'apiList';

  Controller({
    required this.localStorageService,
    required this.remoteService,
  });

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();

  List<Person> onlineList = [];

  List<Person> offlineList = [];

  List<Person> favoriteList = [];

  savePersonInFavorite(Person person) {
    if (!favoriteList.contains(person)) {
    favoriteList.add(person);
    }
    notifyListeners();
    inspect(favoriteList);
  }

   removePersonInFavorite(Person person) {
    favoriteList.remove(person);
    notifyListeners();
    inspect(favoriteList);
  }

  Future<List<Person>> getDataController() async {
    try {
      onlineList = await remoteService.getData();
      notifyListeners();
      return onlineList;
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
    return [];
  }

  Future<void> postDataController(String name, int age) async {
    try {
      final data =
          await remoteService.postData(body: {'name': name, 'age': age});
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

  Future<void> saveDataInCache() async {
    final cacheList = onlineList.map((e) => jsonEncode(e.toJson())).toList();
    await localStorageService.writeData(
      key: keyShared,
      list: cacheList,
    );
  }

  Future<List<Person>> loadDataFromCache() async {
    final cacheList = await localStorageService.readData(key: keyShared);
    if (cacheList != null) {
      offlineList =
          List<Map<String, dynamic>>.from(cacheList.map((e) => jsonDecode(e)))
              .map(Person.fromJson)
              .toList();
      notifyListeners();
      // fazendo o sort por idade
      // offlineList.sort(((a, b) => a.age!.compareTo(b.age!)));
    }
    return [];
  }

  textFilterName(String value) {
    List<Person> listFiltered =
        offlineList.where((e) => e.name.toString().contains(value)).toList();
    inspect(listFiltered);
  }

  textFilterAge(String value) {
    List<Person> listFiltered =
        offlineList.where((e) => e.age.toString().contains(value)).toList();
    inspect(listFiltered);
  }

  // filtrando por nome e idade
  textFilterNameAndAge(String name, String age) {
    List<Person> listFiltered = offlineList
        .where((e) => e.age.toString() == age && e.name == name)
        .toList();
    inspect(listFiltered);
  }
}
