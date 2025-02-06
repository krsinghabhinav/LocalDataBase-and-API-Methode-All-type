import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/sendjobmodel(post).dart';
import '../putpetch_GtexController/put_petch_controller.dart';

class PutPetchGetxUi extends StatefulWidget {
  const PutPetchGetxUi({super.key});

  @override
  State<PutPetchGetxUi> createState() => _PutPetchGetxUiState();
}

class _PutPetchGetxUiState extends State<PutPetchGetxUi> {
  final PutPetchController putPetchController = Get.put(PutPetchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job Put'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: putPetchController.idController,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            TextField(
              controller: putPetchController.nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: putPetchController.jobController,
              decoration: const InputDecoration(
                labelText: 'Job',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sendjobPostModel postModel = sendjobPostModel(
                  job: putPetchController.nameController.text,
                  name: putPetchController.jobController.text,
                );

                putPetchController.putUpdateDataGetx(
                    postModel, putPetchController.idController.text);
              },
              child: const Text("Save"),
            ),

            // ✅ Show loading indicator only when `isLoading.value` is true
            Obx(() {
              if (putPetchController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return Container();
              }
            }),

            // ✅ Display updated job details dynamically
            Obx(() {
              var updatedData = putPetchController.putdataChange.value;
              if (updatedData.name != null && updatedData.job != null) {
                return Card(
                  child: ListTile(
                    title: const Text("Job Updated"),
                    subtitle: Text(
                      "ID:- ${putPetchController.idController.text}\n"
                      "Name:- ${updatedData.name}\n"
                      "Job:- ${updatedData.job}\n"
                      "Date:- ${updatedData.updatedAt}\n",
                    ),
                  ),
                );
              } else {
                return Container(); // ✅ Avoids unnecessary rendering
              }
            }),
          ],
        ),
      ),
    );
  }
}
