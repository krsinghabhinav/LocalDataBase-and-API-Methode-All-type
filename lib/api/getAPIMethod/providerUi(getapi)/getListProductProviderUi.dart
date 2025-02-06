import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providerController(getapi)/getListProductController.dart';

class Getlistproductproviderui extends StatefulWidget {
  const Getlistproductproviderui({super.key});

  @override
  State<Getlistproductproviderui> createState() =>
      _GetlistproductprovideruiState();
}

class _GetlistproductprovideruiState extends State<Getlistproductproviderui> {
  @override
  void initState() {
    super.initState();

    /// Delaying the API call until after the build phase
    Future.microtask(() {
      Provider.of<GetlistproductProviderController>(context, listen: false)
          .getProductContro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Product List')),
      body: Consumer<GetlistproductProviderController>(
        builder: (BuildContext context, provider, child) {
          if (provider.isloading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.productModel == null || provider.productModel!.isEmpty) {
            return Center(child: Text('No Data Found'));
          }
          return ListView.builder(
            itemCount: provider.productModel!.length,
            itemBuilder: (context, index) {
              var fetchdata = provider.productModel![index];

              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(fetchdata.title ?? "No Title"),
                  subtitle: Text(fetchdata.description ?? "No Description"),
                  trailing: Container(
                    width: 100, // Limit the width for images
                    height: 80,
                    child: fetchdata.images != null &&
                            fetchdata.images!.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: fetchdata.images!.length,
                            itemBuilder: (context, imgIndex) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    fetchdata.images![imgIndex],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.image_not_supported,
                                          size: 60);
                                    },
                                  ),
                                ),
                              );
                            },
                          )
                        : Icon(Icons.image_not_supported),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
