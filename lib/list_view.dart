import 'package:flutter/material.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/model/model.dart';
import 'package:semana_api/person_detail.dart';
import 'package:semana_api/shared/core/dependencies.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);
  @override
  State<ListViewPage> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPage> {
  final Controller controller = getIt<Controller>();

  void _handleTap(ApitesteModel model) {
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
      body: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          shrinkWrap: true,
          itemCount: controller.offlineList.length,
          itemBuilder: (context, index) {
            final model = controller.offlineList[index];
            return GestureDetector(
              onTap: () => _handleTap(controller.offlineList[index]),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(model.id.toString()),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(model.toString()),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
