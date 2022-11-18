import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/views/list_view.dart';
import 'package:semana_api/model/model.dart';
import 'package:semana_api/shared/core/dependencies.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller controller = getIt<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Person>>(
            future: controller.getDataController(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'API request',
                      ),
                      ElevatedButton(
                          onPressed: () {
                            log('lista');
                            inspect(controller.onlineList);
                          },
                          child: const Text('lista')),
                      ElevatedButton(
                          onPressed: () {
                            controller.getDataController();
                          },
                          child: const Text('get')),
                      ElevatedButton(
                          onPressed: () async {
                            await controller.postDataController('Joana', 30);
                          },
                          child: const Text('post')),
                      ElevatedButton(
                          onPressed: () {
                            log('salvando dados no cache...');
                            controller.saveDataInCache();
                          },
                          child: const Text('salvar no cache')),
                      ElevatedButton(
                          onPressed: () {
                            inspect(controller.offlineList);
                          },
                          child: const Text('inspecionar dados do cache')),
                      ElevatedButton(
                          onPressed: () {
                            controller.textFilterNameAndAge(
                                controller.input1.text, controller.input2.text);
                          },
                          child:
                              const Text('filtrar por nome e idade na lista')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListViewPage()));
                          },
                          child: const Text('TELA LISTA')),
                      ElevatedButton(
                          onPressed: () {
                            inspect(controller.favoriteList);
                          },
                          child: const Text('veririficar favoritos')),
                      TextField(
                        controller: controller.input1,
                        onChanged: controller.textFilterName,
                      ),
                      TextField(
                        controller: controller.input2,
                        onChanged: controller.textFilterAge,
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
