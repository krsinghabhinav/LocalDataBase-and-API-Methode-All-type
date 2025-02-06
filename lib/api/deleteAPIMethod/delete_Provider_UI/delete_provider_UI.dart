import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../delete_Provider/delete_providerController.dart';

class DeleteProviderUi extends StatefulWidget {
  const DeleteProviderUi({super.key});

  @override
  State<DeleteProviderUi> createState() => _DeleteProviderUiState();
}

class _DeleteProviderUiState extends State<DeleteProviderUi> {
  @override
  void dispose() {
    Provider.of<DeleteProvidercontroller>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deleteProvider = Provider.of<DeleteProvidercontroller>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: deleteProvider.deleteController,
              decoration: const InputDecoration(
                labelText: 'Enter ID to Delete',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                deleteProvider
                    .deleteUserId(deleteProvider.deleteController.text);
              },
              child: deleteProvider.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Delete"),
            ),
            const SizedBox(height: 20),
            deleteProvider.deletedId != null
                ? Card(
                    color: Colors.red.shade100,
                    child: ListTile(
                      title: Text(
                        "Job with ID ${deleteProvider.deletedId} has been deleted!",
                        style: const TextStyle(color: Colors.red),
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
