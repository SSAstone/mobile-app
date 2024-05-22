import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
// import 'package:mobile_app/screens/home/home_view.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Product View'),
      ),
      body: Center(
        child: InkWell(
          child: const Text('Product Page'),
          onTap: () => context.go('/details'),
        ),
      ),
    );
  }
}
