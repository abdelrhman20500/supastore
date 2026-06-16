import 'package:flutter/material.dart';
import 'package:supastore/Core/utilis/app_color.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: AppColors.kPrimaryColor,
        ));
  }
}
