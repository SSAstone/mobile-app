import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:mobile_app/screens/home/home_view.dart';
import 'package:mobile_app/utitls/colors.dart';
import 'package:mobile_app/widget/btn/primary_btn.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
@override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => GoRouter.of(context).go('/main'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/ecommerce.jpg',
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.all(10.0),
              height: size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Discover the best\nRecord app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    'Get your money in three easy steps\nthe palm of your hand ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  PrimaryBtn(
                    title: 'Get Started',
                    onTopPressed: () => context.go('/main'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
