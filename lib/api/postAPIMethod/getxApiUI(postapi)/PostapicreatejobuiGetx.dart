import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getxController(postapi)/postApiCreateJobController.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/PostCreateJobModel.dart';

import '../model(postapi)/sendjobmodel(post).dart';

class PostapicreatejobuiGetx extends StatefulWidget {
  const PostapicreatejobuiGetx({super.key});

  @override
  State<PostapicreatejobuiGetx> createState() => _PostapicreatejobuiGetxState();
}

class _PostapicreatejobuiGetxState extends State<PostapicreatejobuiGetx> {
  final Postapicreatejobcontroller controller =
      Get.put(Postapicreatejobcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: controller.jobController,
              decoration: const InputDecoration(
                labelText: 'Job',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Create the job post model
                // this is best method to used to update the data
                var postModel = sendjobPostModel(
                  job: controller.jobController.text,
                  name: controller.nameController.text,
                );

                // var data = {
                //   "name": controller.nameController.text,
                //   "job": controller.jobController.text,
                // };

                // Call the API method to post the job data
                controller.postFetchCreateDataGetx(postModel);
              },
              child: const Text("Save"),
            ),
            // Display data when userdata is not null
            Obx(() {
              return controller.userdata.value.name != null
                  ? Card(
                      child: ListTile(
                        title: const Text("Job Created"),
                        subtitle: Text(
                          "name:- ${controller.userdata.value.name}\n"
                          "job:- ${controller.userdata.value.job}\n"
                          "id:- ${controller.userdata.value.id}\n"
                          "date:- ${controller.userdata.value.createdAt?.toString() ?? 'N/A'}",
                        ),
                      ),
                    )
                  : Container(); // Show an empty container if userdata is null
            }),
          ],
        ),
      ),
    );
  }
}
