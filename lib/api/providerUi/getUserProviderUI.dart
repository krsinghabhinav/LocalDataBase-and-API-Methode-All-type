import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providerController/getuserpostprovider.dart';

class Getuserproviderui extends StatefulWidget {
  const Getuserproviderui({super.key});

  @override
  State<Getuserproviderui> createState() => _GetuserprovideruiState();
}

class _GetuserprovideruiState extends State<Getuserproviderui> {
  @override
  void initState() {
    Getuserpostprovider getprovider = Provider.of(context, listen: false);
    getprovider.getUserData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get User Provider'),
      ),
      body: Column(
        children: [
          Consumer<Getuserpostprovider>(
            builder: (BuildContext context, provider, child) {
              if (provider.isloading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.userData == null ||
                  provider.userData!.data!.isEmpty) {
                return Center(child: Text('No Data Found'));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.userData!.data!.length,
                  itemBuilder: (context, index) {
                    var fetchdata = provider.userData!.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(fetchdata.avatar.toString()),
                      ),
                      title:
                          Text("${fetchdata.firstName} ${fetchdata.lastName}"),
                      subtitle: Text(fetchdata.email.toString()),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
