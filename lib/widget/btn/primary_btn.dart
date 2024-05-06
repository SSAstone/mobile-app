import 'package:flutter/material.dart';
import 'package:mobile_app/utitls/colors.dart';

class PrimaryBtn extends StatefulWidget {
  final String title;
  final void Function()? onTopPressed;
  const PrimaryBtn({super.key, required this.title, required this.onTopPressed});


  @override
  State<PrimaryBtn> createState() => _PrimaryBtnState();
}

class _PrimaryBtnState extends State<PrimaryBtn> {
  get onTopPressed => null;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTopPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(5, 7),
              spreadRadius: 5,
            )
          ],
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
