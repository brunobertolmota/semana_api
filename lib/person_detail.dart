import 'package:flutter/material.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/model/model.dart';
import 'package:semana_api/shared/core/dependencies.dart';

class PersonDetailsPage extends StatelessWidget {
  final Person model;
  final Controller controller = getIt<Controller>();

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
          Text(textAlign: TextAlign.right, model.toString()),
          ElevatedButton(
            onPressed: () => controller.savePersonInFavorite(model),
            child: Text('Adicionar ${model.name} a lista de favoritos'),
          )
        ],
      ),
    );
  }
}

class PersonDetailsPageArgs {
  final Person model;

  PersonDetailsPageArgs({
    required this.model,
  });
}
