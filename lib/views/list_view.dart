import 'package:flutter/material.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/model/model.dart';
import 'package:semana_api/views/person_detail.dart';
import 'package:semana_api/shared/core/dependencies.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);
  @override
  State<ListViewPage> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPage> {
  final Controller controller = getIt<Controller>();
  @override
  void initState() {
    if (controller.offlineList.isEmpty) {
      controller.loadDataFromCache();
    }
    super.initState();
  }

  void _handleTap(Person model) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PersonDetailsPage(
          args: PersonDetailsPageArgs(
            model: model,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tabela pessoas'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: controller.offlineList
                        .map(
                          (person) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(children: [
                                Text(person.toString()),
                                const SizedBox(
                                  width: 20,
                                ),
                                controller.favoriteList.contains(person)
                                    ? GestureDetector(
                                        onTap: () => controller
                                            .removePersonInFavorite(person),
                                        child: const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () => controller
                                            .savePersonInFavorite(person),
                                        child: const Icon(Icons.star),
                                      ),
                              ]),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
