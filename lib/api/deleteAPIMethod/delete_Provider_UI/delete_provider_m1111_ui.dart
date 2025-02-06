import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/sendjobmodel(post).dart';
import '../delete_Provider/delete_providerController.dart';
import '../delete_Provider/delete_providerControllerM111.dart';

class DeleProviderControllerM1 extends StatefulWidget {
  const DeleProviderControllerM1({super.key});

  @override
  State<DeleProviderControllerM1> createState() =>
      _DeleProviderControllerM1State();
}

class _DeleProviderControllerM1State extends State<DeleProviderControllerM1> {
  @override
  void dispose() {
    Provider.of<DeleProviderControllerM1111>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deleteProvider = Provider.of<DeleProviderControllerM1111>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job put'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: deleteProvider.deleteController,
              decoration: const InputDecoration(
                labelText: 'id ',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                deleteProvider.deleteUserId(
                    context, deleteProvider.deleteController.text);
              },
              child: Text("Save"),
            ),
            deleteProvider.deletedItem != null
                ? Card(
                    child: ListTile(
                      title: Text("Job Created"),
                      subtitle: Text(
                        "ID:- ${deleteProvider.deleteController.text}\n"
                        "title:- ${deleteProvider.deletedItem!.title}\n"
                        "price:- ${deleteProvider.deletedItem!.price}\n"
                        "rating:- ${deleteProvider.deletedItem!.rating!.rate}\n"
                        "description:- ${deleteProvider.deletedItem!.description}\n",
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
