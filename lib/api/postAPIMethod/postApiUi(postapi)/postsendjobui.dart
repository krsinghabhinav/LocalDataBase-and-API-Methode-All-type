import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/sendjobmodel(post).dart';
import '../ProviderController(postapi)/PostapiCreateProvider.dart';

class Postsendjobui extends StatefulWidget {
  const Postsendjobui({super.key});

  @override
  State<Postsendjobui> createState() => _PostsendjobuiState();
}

class _PostsendjobuiState extends State<Postsendjobui> {
  @override
  void dispose() {
    Provider.of<Postapicreateprovider>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<Postapicreateprovider>(context);

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
                labelText: 'Name ',
              ),
            ),
            TextField(
              controller: postProvider.jobController,
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
                  job: postProvider.nameController.text,
                  name: postProvider.jobController.text,
                );

                postProvider.fetchPostCreateJob(postModel);
              },
              child: Text("Save"),
            ),
            postProvider.userData != null
                ? Card(
                    child: ListTile(
                      title: Text("Job Created"),
                      subtitle: Text(
                        "name:- ${postProvider.userData!.name}\n"
                        "job:- ${postProvider.userData!.job}\n"
                        "id:- ${postProvider.userData!.id}\n"
                        "date:- ${postProvider.userData!.createdAt.toString()}",
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
