import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providerController(getapi)/getproductWithoutmodel.dart';

class Getproductwithouthmodelui extends StatefulWidget {
  const Getproductwithouthmodelui({super.key});

  @override
  State<Getproductwithouthmodelui> createState() =>
      _GetproductwithouthmodeluiState();
}

class _GetproductwithouthmodeluiState extends State<Getproductwithouthmodelui> {
  @override
  void initState() {
    super.initState();

    /// Delaying the API call until after the build phase
    Future.microtask(() {
      Provider.of<GetproductwithoutmodelProvider>(context, listen: false)
          .getProductContro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Product List')),
      body: Consumer<GetproductwithoutmodelProvider>(
        builder: (context, provider, child) {
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
                  title: Text(fetchdata['title'] ?? "No Title"),
                  subtitle: Text(fetchdata['description'] ?? "No Description"),
                  trailing: Container(
                    width: 100, // Limit the width for images
                    height: 80,
                    child: fetchdata['images'] != null &&
                            (fetchdata['images'] as List).isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: (fetchdata['images'] as List).length,
                            itemBuilder: (context, imgIndex) {
                              return Padding(
                                padding:  
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    fetchdata['images'][imgIndex],
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
