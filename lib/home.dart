import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/model/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'API request',
            ),
            ElevatedButton(
                onPressed: () {
                  controller.getDataController();
                },
                child: const Text('get')),
            ElevatedButton(
                onPressed: () {
                  controller.postDataController('Amanda', 23);
                },
                child: const Text('post')),
          ],
        ),
      ),
    );
  }
}
