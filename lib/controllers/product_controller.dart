import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/product_models.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  ProductModel productModel = ProductModel(
    status: 0,
    message: '',
    totalDocs: 0,
    docs: [],
    limit: 0,
    page: 0,
    nextPage: false,
    prevPage: false,
    totalPages: 0,
    pagingCounter: null,
    meta: '',
    success: false,
  );

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    isLoading.value = true;
    try {
      final http.Response response = await http.get(
        Uri.parse("http://192.168.0.104:5550/product"),
      );
      if (response.statusCode == 200) {
        productModel = ProductModel.fromJson(jsonDecode(response.body));
        if (productModel.success) {
          print(jsonDecode(response.body));
          final responseData = productModel.docs;
          print("Response data: $responseData");
        } else {
          print("API request failed: ${productModel.message}");
        }
      } else {
        print("HTTP Error: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    } finally {
      isLoading.value = false;
    }
  }
}
