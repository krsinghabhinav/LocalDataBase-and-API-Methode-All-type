import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/sqflite/database.dart';

class Sqfliteui extends StatefulWidget {
  const Sqfliteui({super.key});

  @override
  State<Sqfliteui> createState() => _SqfliteuiState();
}

class _SqfliteuiState extends State<Sqfliteui> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  late DataHelper dataHelper = DataHelper.instance;
  List<Map<String, dynamic>> itemdata = [];

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  void loaddata() async {
    itemdata = await dataHelper.getAllItems();
    setState(() {});
  }

  void additem() async {
    await dataHelper.addItemindata(
      nameController.text,
      double.parse(priceController.text),
    );
    nameController.clear();
    priceController.clear();
    loaddata();
  }

  void updateitem(int id, String name, double price) async {
    await dataHelper.updateitem(id, name, price);
    loaddata();
  }

  void deleteitem(int index) async {
    await dataHelper.deleteitem(index);
    loaddata();
  }

  void isfavioratetrue(int index, int isfavioratetrue) async {
    await dataHelper.addtoggleFaviour(index, isfavioratetrue == 1 ? 0 : 1);
    loaddata();
  }

  void iscartitem(int index, int iscartitems) async {
    await dataHelper.addisToCart(index, iscartitems == 1 ? 0 : 1);
    loaddata();
  }

  // Function to show dialog for updating item data
  void showUpdateDialog(int id, String currentName, double currentPrice) {
    nameController.text = currentName;
    priceController.text = currentPrice.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Cancel button
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save button: Update the item in the database
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty) {
                  updateitem(id, nameController.text,
                      double.parse(priceController.text));
                  Navigator.of(context).pop();
                } else {
                  // Show a warning if any field is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')));
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQflite UI'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: additem,
            child: Text('Add Item'),
          ),
          // Wrapping ListView.builder with Expanded widget to prevent layout issue
          Expanded(
            child: ListView.builder(
              itemCount: itemdata.length,
              itemBuilder: (context, index) {
                var data = itemdata[index];
                return ListTile(
                  title: Text("Name= ${data['name']}"),
                  subtitle: Text("Price= ${data['price']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          isfavioratetrue(data['id'], data['isFavorite']);
                        },
                        icon: Icon(data['isFavorite'] == 1
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {
                          iscartitem(data['id'], data['isCart']);
                        },
                        icon: Icon(
                          data['isCart'] == 1
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Show the dialog when edit is clicked
                          showUpdateDialog(data['id'], data['name'],
                              data['price']);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteitem(data['id']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
