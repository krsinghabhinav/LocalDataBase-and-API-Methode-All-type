import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/sendjobmodel(post).dart';
import '../ProviderController(postapi)/PostapiCreateProvider.dart';
import '../ProviderController(postapi)/postapicreateproviderwithoutmodel.dart';

class Postcreatejobuiwithoutmodelui extends StatefulWidget {
  const Postcreatejobuiwithoutmodelui({super.key});

  @override
  State<Postcreatejobuiwithoutmodelui> createState() =>
      _PostcreatejobuiwithoutmodeluiState();
}

class _PostcreatejobuiwithoutmodeluiState
    extends State<Postcreatejobuiwithoutmodelui> {
  @override
  void dispose() {
    Provider.of<PostapicreateWithoutModelprovider>(context, listen: false)
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostapicreateWithoutModelprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: postProvider.nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: postProvider.jobController,
              decoration: const InputDecoration(
                labelText: 'Job',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sendjobPostModel postModel = sendjobPostModel(
                  name: postProvider.nameController.text,
                  job: postProvider.jobController.text,
                );

                postProvider.fetchPostCreateJobWithoutModel(postModel);
              },
              child: Text("Save"),
            ),
            postProvider.userData != null
                ? Card(
                    child: ListTile(
                      title: Text("Job Created"),
                      subtitle: Text(
                        "Name: ${postProvider.userData['name']}\n"
                        "Job: ${postProvider.userData['job']}\n"
                        "ID: ${postProvider.userData['id']}\n"
                        "Date: ${postProvider.userData['createdAt']}",
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
