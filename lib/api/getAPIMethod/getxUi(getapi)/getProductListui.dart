import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getxController(getapi)/getListProductController.dart';
import '../providerController(getapi)/getListProductController.dart';

class GetProductListUI extends StatefulWidget {
  const GetProductListUI({super.key});

  @override
  State<GetProductListUI> createState() => _GetProductListUIState();
}

class _GetProductListUIState extends State<GetProductListUI> {
  final GetlistproductGetxController controller = Get.put(GetlistproductGetxController());

  @override
  void initState() {
    super.initState();
    controller.getListGetxControll(); // ✅ Fixed method name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Product List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productmodel.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return ListView.builder(
          itemCount: controller.productmodel.length, // ✅ Fixed variable name
          itemBuilder: (context, index) {
            var product = controller.productmodel[index];

            return ListTile(
              leading: product.images != null && product.images!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.images!.first,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported, size: 60);
                        },
                      ),
                    )
                  : const Icon(Icons.image_not_supported, size: 60),
              title: Text(product.title ?? "No Title"),
              subtitle: Text(product.description ?? "No Description"),
            );
          },
        );
      }),
    );
  }
}
