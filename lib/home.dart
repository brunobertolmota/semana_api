import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:semana_api/model.dart';  

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var dio = Dio();
  
  void get () async {
  Response response;
  response = await dio.get('https://62ed7452c1ef25f3da7a446f.mockapi.io/trampeei/v1/test');
  var mockList = List.from(response.data)
          .map((e) => Apiteste.fromJson(e))
          .toList();
  
  log('resposta: ' + response.data.toString());
  inspect(mockList);

  }

  void post() async {
  Response response;
  response = await dio.post('https://62ed7452c1ef25f3da7a446f.mockapi.io/trampeei/v1/test', data: {'nome': 'Amanda', 'idade': 23});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text(
              'API request',
            ),
            ElevatedButton(onPressed: get, child: const Text('get')),
            ElevatedButton(onPressed: post, child: const Text('post')),       
          ],
        ),
      ),
    );
  }
}
