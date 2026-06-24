import 'package:flutter/material.dart';
import '../../Features/Auth/presentation/view/widget/custom_text_button.dart';
import '../../Features/product_details/presentation/view/product_details.dart';
import '../functions/navigate_to.dart';
import '../utilis/app_color.dart';
import 'cached_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, const ProductDetails());
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),),
          color: AppColors.kWhiteColor,
          child: Column(
            children: [
              Stack(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight:Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    ),
                    child:CachedImage(url: "https://i.imgur.com/keVCVIa.jpeg",),
                  ),
                  Positioned(
                      child: Container(
                        alignment: Alignment.center,
                        width: 65,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            )
                        ),
                        child: const Text("10% Off", style: TextStyle(color: AppColors.kWhiteColor),),
                      )
                  )
                ],
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Product Name",style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            Text("100 LE",style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold),),
                            Text("120 LE",style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                                fontWeight: FontWeight.bold, color: AppColors.kGreyColor),)
                          ],
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: CustomTextButton(text: "Buy Now", color:AppColors.kWhiteColor,onTab: (){},))
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
