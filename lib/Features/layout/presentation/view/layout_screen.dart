import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:supastore/Features/favorite/presentation/view/favorite_view.dart';
import 'package:supastore/Features/home/presentation/view/home_view.dart';
import 'package:supastore/Features/profile/presentation/view/profile_view.dart';
import 'package:supastore/Features/store/presentation/view/store_view.dart';
import '../../../../Core/utilis/app_color.dart';
import '../view_manger/cubit/nav_bar_cubit.dart';
import '../view_manger/cubit/nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  final List<Widget> tabs=[
    const HomeView(),
    const StoreView(),
    const FavoriteView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: tabs[cubit.currentIndex]
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: AppColors.kWhiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: GNav(
                    onTabChange: (index) {
                      cubit.changeIndex(index); // Update the index here
                    },
                    rippleColor: AppColors.kPrimaryColor, // tab button ripple color when pressed
                    hoverColor: AppColors.kPrimaryColor, // tab button hover color
                    haptic: true, // haptic feedback
                    tabBorderRadius: 15,
                    duration: const Duration(milliseconds: 200), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor: AppColors.kWhiteColor, // selected icon and text color
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor: AppColors.kPrimaryColor, // selected tab background color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
                    tabs: const [
                      GButton(icon: Icons.home, text: 'Home',),
                      GButton(icon: Icons.store, text: 'Store',),
                      GButton(icon: Icons.favorite, text: 'Favorite',),
                      GButton(icon: Icons.person, text: 'Profile',),
                    ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
