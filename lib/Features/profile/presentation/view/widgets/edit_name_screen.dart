import 'package:flutter/material.dart';
import '../../../../../../../../Core/functions/build_app_bar.dart';
import '../../../../../Core/utilis/app_color.dart';
import '../../../../Auth/presentation/view/widget/custom_text_button.dart';
import '../../../../Auth/presentation/view/widget/custom_text_field.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,"Edit Name"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextField(labelText: "Edit Name"),
            const SizedBox(height: 12,),
            Container(
                height: MediaQuery.of(context).size.height*0.05,
                width:MediaQuery.of(context).size.width*0.2,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(child: CustomTextButton(text: "Update",onTab: (){},color: AppColors.kWhiteColor,))),
          ],
        ),
      ),
    );
  }

}
