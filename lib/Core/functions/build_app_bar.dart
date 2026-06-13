import 'package:flutter/material.dart';
import '../utilis/app_color.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    centerTitle: true,
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: const Icon(Icons.arrow_back_ios),color: AppColors.kWhiteColor,),
    title: Text(title,style: const TextStyle(color: AppColors.kWhiteColor),),
  );
}
