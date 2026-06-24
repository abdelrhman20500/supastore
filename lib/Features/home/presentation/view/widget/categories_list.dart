import 'package:flutter/material.dart';

import '../../../../../Core/utilis/app_color.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height*0.14,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index){
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kWhiteColor,
                      child: Icon(categories[index].icon, size: 40,),
                    ),
                    Text(categories[index].text)
                  ],
                )
            );
          }
      ),
    );
  }
}


List<Category> categories=[
  Category(icon: Icons.sports, text: "Sports"),
  Category(icon: Icons.electric_bike, text: "electric"),
  Category(icon: Icons.collections, text: "Collections"),
  Category(icon: Icons.book, text: "Books"),
  Category(icon: Icons.games, text: "Games"),

];
class Category{
  final IconData icon;
  final String text;

  Category({required this.icon, required this.text});
}