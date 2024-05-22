import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/controllers/product_controller.dart';
import 'package:mobile_app/models/product_models.dart';

class HomeView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
        title: Text('All Products'),
        
      ),
      body: Center(
        child: Obx(
          () {
            if (productController.isLoading.value) {
              return CircularProgressIndicator();
            } else if (productController.productModel.success) {
              final List<Docs> products = productController.productModel.docs;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      leading: Image.network(
                        product.image,
                        height: 100,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      trailing: Text('${product.price} \$'),
                    ),
                  );
                },
              );
            } else {
              return Text(
                'Failed to fetch products: ${productController.productModel.message}',
              );
            }
          },
        ),
      ),
    );
  }
}
