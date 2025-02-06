import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ProviderController(postapi)/PostapiCreateProvider.dart';

class PostCreateJobUIM2 extends StatefulWidget {
  const PostCreateJobUIM2({super.key});

  @override
  State<PostCreateJobUIM2> createState() => _PostCreateJobUIState();
}

class _PostCreateJobUIState extends State<PostCreateJobUIM2> {
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
          child: Column(children: [
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
                var data = {
                  "name": postProvider.nameController.text,
                  "job": postProvider.jobController.text,
                };
                postProvider.fetchPostCreateJob(data);
              },
              child: Text("Save"),
            ),
            postProvider.userData != null
                ? Card(
                    child: ListTile(
                      title: Text("Job Created"),
                      subtitle: Text("name:- ${postProvider.userData!.name}\n"
                          "job:- ${postProvider.userData!.job}\n"
                          "${postProvider.userData!.id}\n"
                          "${postProvider.userData!.createdAt.toString()}"),
                    ),
                  )
                : Container(),
          ])),
    );
  }
}
