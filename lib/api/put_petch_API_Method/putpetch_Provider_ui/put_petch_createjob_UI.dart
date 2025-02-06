import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/sendjobmodel(post).dart';
import '../putpetch_provider/putapi_ProviderController.dart';

class PutPetchCreatejobUi extends StatefulWidget {
  const PutPetchCreatejobUi({super.key});

  @override
  State<PutPetchCreatejobUi> createState() => _PutPetchCreatejobUiState();
}

class _PutPetchCreatejobUiState extends State<PutPetchCreatejobUi> {
  @override
  void dispose() {
    Provider.of<PutapiProvidercontroller>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final putProvider = Provider.of<PutapiProvidercontroller>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job put'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: putProvider.idController,
              decoration: const InputDecoration(
                labelText: 'id ',
              ),
            ),
            TextField(
              controller: putProvider.nameController,
              decoration: const InputDecoration(
                labelText: 'Name ',
              ),
            ),
            TextField(
              controller: putProvider.jobController,
              decoration: const InputDecoration(
                labelText: 'job',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // var data = {
                //   "name": postProvider.nameController.text,
                //   "job": postProvider.jobController.text,
                // };
                sendjobPostModel postModel = sendjobPostModel(
                  job: putProvider.nameController.text,
                  name: putProvider.jobController.text,
                );

                putProvider.putUpdateData(
                    postModel, putProvider.idController.text);
              },
              child: Text("Save"),
            ),
            putProvider.userUpdateData != null
                ? Card(
                    child: ListTile(
                      title: Text("Job Created"),
                      subtitle: Text(
                        "ID:- ${putProvider.idController.text}\n"
                        "name:- ${putProvider.userUpdateData!.name}\n"
                        "job:- ${putProvider.userUpdateData!.job}\n"
                        "date:- ${putProvider.userUpdateData!.updatedAt}\n",
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
