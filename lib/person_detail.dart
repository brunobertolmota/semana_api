import 'package:flutter/material.dart';
import 'package:semana_api/model/model.dart';

class PersonDetailsPage extends StatelessWidget {
  final ApitesteModel model;

  PersonDetailsPage({
    super.key,
    required PersonDetailsPageArgs args,
  }) : model = args.model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pessoa')),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(16.0)),
          Text(textAlign: TextAlign.right ,model.toString()),
        ],
      ),
    );
  }
}

class PersonDetailsPageArgs {
  final ApitesteModel model;

  PersonDetailsPageArgs({
    required this.model,
  });
}
