import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/shared/core/dependencies.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = getIt<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                    controller.saveData();
                  },
                  child: const Text('salvar no cache')),
              ElevatedButton(
                  onPressed: () {
                    controller.loadData();
                  },
                  child: const Text('carregar do cache')),
              ElevatedButton(
                  onPressed: () {
                    inspect(controller.offlineList);
                  },
                  child: const Text('inspecionar dados do cache')),
              ElevatedButton(
                  onPressed: () {
                    controller.textFilterNameAndAge(controller.input1.text, controller.input2.text);
                  },
                  child: const Text('filtrar por nome e idade na lista')),
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
        ),
      ),
    );
  }
}
