import 'package:flutter/material.dart';
import 'package:supastore/Core/utilis/app_color.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.labelText, this.suffixIcon,
    this.isSecure= false, this.controller, this.keyboardType
  });

  final String labelText;
  final Widget? suffixIcon;
  final bool isSecure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText:isSecure,
      controller: controller,
      obscuringCharacter: "*",
      validator: (value){
        if(value ==null || value.isEmpty){
          return "This Field is Required";
        }
        return null;
      },
      decoration:InputDecoration(
        suffixIcon:suffixIcon ,
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                width: 2,
                color: AppColors.kBordersideColor
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                width: 2,
                color: AppColors.kBordersideColor
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                width: 2,
                color: AppColors.kBordersideColor
            )
        ),
      ),
    );
  }
}
