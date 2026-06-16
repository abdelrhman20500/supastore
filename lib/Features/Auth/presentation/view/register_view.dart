import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supastore/Core/utilis/app_color.dart';
import 'package:supastore/Features/Auth/presentation/view/login_view.dart';
import 'package:supastore/Features/Auth/presentation/view/widget/custom_row.dart';
import 'package:supastore/Features/Auth/presentation/view/widget/custom_text_button.dart';
import 'package:supastore/Features/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_cubit.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_states.dart';
import '../../../home_view.dart';

class RegisterView extends StatefulWidget {
   const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}
class _RegisterViewState extends State<RegisterView> {
   final nameController = TextEditingController();
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
          if(state is RegisterLoading){
            const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }else if(state is RegisterFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ));
          }else if(state is RegisterSuccess || state is SignInGoogleSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            HomeView()));
          }
        },
        builder: (context, state) {
          /// call Cubit ....
          AuthCubit cubit = context.read<AuthCubit>();
          return Scaffold(
            body: SafeArea(
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
                              CustomTextField(labelText: "Name",controller: nameController,),
                              SizedBox(height: height*0.03,),
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
                              CustomRow(text: "Sign Up",onPressed: ()
                              {
                                if(formKey.currentState!.validate()){
                                  cubit.userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },),
                              SizedBox(height: height*0.027,),
                              CustomRow(text: "Sign Up with Google",icon: Icons.g_mobiledata,
                                onPressed: (){
                                cubit.googleSignIn();
                                },),
                              SizedBox(height: height*0.027,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an Account? ", style:TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.kBlackColor),),
                                  CustomTextButton(text: "Login",onTab: ()
                                  {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>LoginView()));
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
