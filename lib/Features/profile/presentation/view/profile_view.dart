import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supastore/Core/component/custom_circular_progress_indicator.dart';
import 'package:supastore/Core/functions/navigate_without_back.dart';
import 'package:supastore/Core/utilis/app_color.dart';
import 'package:supastore/Features/Auth/presentation/view/login_view.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_cubit.dart';
import 'package:supastore/Features/Auth/presentation/view_manager/auth_states.dart';
import 'package:supastore/Features/profile/presentation/view/widgets/edit_name_screen.dart';
import 'package:supastore/Features/profile/presentation/view/widgets/my_order_screen.dart';

import '../../../../Core/component/custom_row_bottom.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return BlocProvider(
      create:(context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if(state is LogoutSuccess){
            navigateWithoutBack(context, LoginView());
          }
        },
        builder: (context, state) {
          return state is LogoutLoading ? CustomCircularProgressIndicator() : Center(
            child: SizedBox(
              height: height*0.7,
              child: Card(
                margin: const EdgeInsets.all(24),
                color: AppColors.kWhiteColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 56,
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        child: Icon(Icons.person, size: 46,),
                      ),
                      SizedBox(height: height*0.03,),
                      const Text("User Name", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: height*0.01,),
                      const Text("abdelrhman95@gmail.com"),
                      SizedBox(height: height*0.02,),
                      CustomRowBottom(onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditNameScreen()));
                      } ,iconData: Icons.person,text: "Edit Name",icon: Icons.arrow_forward_ios,),
                      SizedBox(height: height*0.026,),
                      CustomRowBottom(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyOrderScreen()));
                      } ,iconData: Icons.shopping_basket,text: "My Orders",icon: Icons.arrow_forward_ios,),
                      SizedBox(height: height*0.026,),
                      CustomRowBottom(onTap: ()async{
                        await context.read<AuthCubit>().logout();
                      },
                        iconData: Icons.logout,text: "Logout",icon: Icons.arrow_forward_ios,)
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
