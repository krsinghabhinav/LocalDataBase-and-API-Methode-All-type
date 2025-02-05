import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getxController/getUserGetxCotrolller.dart'; // Update import

class Getusergetxui extends StatefulWidget {
  const Getusergetxui({super.key});

  @override
  State<Getusergetxui> createState() => _GetusergetxuiState();
}

class _GetusergetxuiState extends State<Getusergetxui> {
  final Getusergetxcotrolller controller = Get.put(Getusergetxcotrolller());
  TextEditingController pagenumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch the user data on initial load
    controller.fetchGetUserData(
        pagenumber.text); // Fetch data for page 1 (or any page)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get User'),
      ),
      body: Column(children: [
        TextField(
            controller: pagenumber,
            decoration: InputDecoration(
              labelText: 'Enter Page Number',
            )),
        ElevatedButton(
          onPressed: () {
            controller.fetchGetUserData(pagenumber.text);
          },
          child: Text("page number"),
        ),
        Obx(() {
          if (controller.isloading.value) {
            // Show loading indicator if data is not fetched yet
            return Center(child: CircularProgressIndicator());
          }

          var user = controller.getuserda.value;

          if (user.data == null || user.data!.isEmpty) {
            // If data is null or empty, show a message
            return Center(child: Text('No data available'));
          }

          // Display the data if it's not null and has elements
          return Expanded(
            child: ListView.builder(
              itemCount: user.data!.length, // Adjust according to your model
              itemBuilder: (context, index) {
                var userData = user.data![index];
                return ListTile(
                  title: Text(userData.firstName
                      .toString()), // Adjust according to your model
                  subtitle:
                      Text(userData.email.toString()), // Adjust accordingly
                );
              },
            ),
          );
        }),
      ]),
    );
  }
}
