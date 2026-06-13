import 'package:flutter/material.dart';

import '../utilis/app_color.dart';

class CustomRowBottom extends StatelessWidget {
  const CustomRowBottom({super.key, required this.text, required this.iconData, required this.icon, this.onTap,});

  final String text;
  final IconData iconData;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: InkWell(
        onTap: onTap,
        child:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(iconData, color: AppColors.kWhiteColor,),
              Text(text, style: const TextStyle(fontSize: 22, color: AppColors.kWhiteColor),),
              Icon(icon, color: AppColors.kWhiteColor,),
            ],
          ),
        ),
      ),
    );
  }
}
