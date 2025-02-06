// import 'package:flutter/material.dart';
// import 'package:sqflitetestdeloacal/apiservises/apiservices.dart';
// import 'package:sqflitetestdeloacal/model/getuserobjectModel.dart';

// class ViewGetApiScreen extends StatefulWidget {
//   const ViewGetApiScreen({super.key});

//   @override
//   State<ViewGetApiScreen> createState() => _ViewGetApiScreenState();
// }

// class _ViewGetApiScreenState extends State<ViewGetApiScreen> {
//   Getuserobjectmodel? getUserObjectModel; // Made nullable
//   bool isLoading = false;

//   void getUserDataFetchApi() async {
//     setState(() {
//       isLoading = true; // Fixed assignment
//     });

//     try {
//       final response = await ApiServices().getUserObjectModel("2");

//       setState(() {
//         getUserObjectModel = response;
//         isLoading = false;
//       });

//       print("API Data: ${getUserObjectModel}");
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print("Error: $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getUserDataFetchApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("API Data View")),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator()) // Loading indicator
//           : getUserObjectModel == null
//               ? const Center(child: Text("No data available"))
//               : ListView.builder(
//                   itemCount: getUserObjectModel?.data?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     var user = getUserObjectModel!.data![index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(user.avatar ?? ""),
//                       ),
//                       title: Text("${user.firstName} ${user.lastName}"),
//                       subtitle: Text(user.email ?? ""),
//                     );
//                   },
//                 ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getuserobjectModel.dart';

import 'ApiServices.dart';

class ViewGetApiScreen extends StatefulWidget {
  const ViewGetApiScreen({super.key});

  @override
  State<ViewGetApiScreen> createState() => _ViewGetApiScreenState();
}

class _ViewGetApiScreenState extends State<ViewGetApiScreen> {
  Getuserobjectmodel? getUserObjectModel; // Made nullable
  bool isLoading = false;

  void getUserDataFetchApi() async {
    setState(() {
      isLoading = true; // Fixed assignment
    });

    try {
      final response = await ApiServices().getUserObjectModel("2");

      setState(() {
        getUserObjectModel = response;
        isLoading = false;
      });

      print("API Data: ${getUserObjectModel}");
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDataFetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("API Data View")),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : getUserObjectModel == null
                ? Text("no data here")
                : ListView.builder(
                    itemCount: getUserObjectModel!.data!.length,
                    itemBuilder: (context, index) {
                      var getdata = getUserObjectModel!.data![index];
                      return ListTile(
                        leading: CircleAvatar(
                          foregroundImage:
                              NetworkImage(getdata.avatar.toString()),
                        ),
                        title: Text(getdata.firstName.toString()),
                        subtitle: Text(getUserObjectModel!.page.toString()),
                      );
                    }));
  }
}
