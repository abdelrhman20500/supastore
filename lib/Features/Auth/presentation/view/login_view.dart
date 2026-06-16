import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supastore/Core/component/custom_circular_progress_indicator.dart';
import 'package:supastore/Features/Auth/presentation/view/register_view.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_cubit.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_states.dart';
import 'package:supastore/Features/layout/presentation/view/layout_screen.dart';
import '../../../../Core/utilis/app_color.dart';
import 'widget/custom_row.dart';
import 'widget/custom_text_button.dart';
import 'widget/custom_text_field.dart';

class LoginView extends StatefulWidget {
   const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
         if(state is LoginFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ));
          }else if(state is LoginSuccess || state is SignInGoogleSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                LayoutScreen()));
          }
        },
        builder: (context, state) {
          ///  Cubit Call ...
          AuthCubit cubit = context.read<AuthCubit>();
          return Scaffold(
            body: state is LoginLoading ? CustomCircularProgressIndicator() : SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: height*0.08,),
                      const Text("Welcome To Our Market", style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
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
                              CustomTextField(labelText: "Email",controller: emailController,),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "Password",controller: passwordController,
                                isSecure: isPasswordVisible,
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    isPasswordVisible = ! isPasswordVisible;
                                  });
                                },
                                    icon:Icon(isPasswordVisible
                                        ? Icons.visibility_off : Icons.visibility,
                                      color: Colors.black,)),),
                              SizedBox(height: height*0.03,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomTextButton(text: "Forget Password ?", onTab: () {},)
                                ],
                              ),
                              SizedBox(height: height*0.027,),
                              CustomRow(text: "Login",onPressed: () {
                                if(formKey.currentState!.validate()){
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },),
                              SizedBox(height: height*0.027,),
                              CustomRow(text: "Login with Google",icon: Icons.g_mobiledata
                                ,onPressed: (){
                                cubit.googleSignIn();
                                },),
                              SizedBox(height: height*0.027,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("I Don't have an Account? ", style:TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.kBlackColor),),
                                  CustomTextButton(text: "Sign Up",onTab: ()
                                  {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>RegisterView()));
                                  },),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
