import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supastore/Core/component/custom_circular_progress_indicator.dart';
import 'package:supastore/Core/functions/show_message.dart';
import 'package:supastore/Features/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_cubit.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_states.dart';
import '../../../../Core/utilis/app_color.dart';

class ResetPasswordView extends StatelessWidget {
   ResetPasswordView({super.key});

  static const String routeName ="ForgetPasswordScreen";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   final emailController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if(state is ResetPasswordSuccess)
                {
                  Navigator.pop(context);
                  showMsg(context, "Email Was Sent ");
                }
            },
            builder: (context, state) {
              return state is ResetPasswordLoading ? CustomCircularProgressIndicator() :SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: height*0.08,),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Enter Your Email To Reset Password", style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: height*0.05,),
                      Card(
                        margin: const EdgeInsets.all(24),
                        color: AppColors.kWhiteColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomTextField(labelText: "Email",
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,),
                              SizedBox(height: height*0.03,),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      backgroundColor: AppColors.kPrimaryColor,
                                      foregroundColor: AppColors.kWhiteColor
                                  ),
                                  onPressed:(){
                                    if(formKey.currentState!.validate()){
                                      context.read<AuthCubit>().resetPassword(
                                          email: emailController.text);
                                    }
                                  }, child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                                child: Text("Send", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
