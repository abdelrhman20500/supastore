import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supastore/Features/product_details/presentation/view/widgets/comments_list.dart';
import '../../../../Core/component/cached_image.dart';
import '../../../../Core/functions/build_app_bar.dart';
import '../../../Auth/presentation/view/widget/custom_text_field.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(context, "Product Name"),
      body: ListView(
        children:  [
          const CachedImage(url: "https://i.imgur.com/keVCVIa.jpeg"),
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Name", style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text("245 LE", style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text("0", style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.star, color: Colors.yellowAccent,size: 36,)
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,
                        size: 36,))
                  ],
                ),
                const SizedBox(height: 12,),
                const Text("Product Description"),
                const SizedBox(height: 12,),
                RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
                const SizedBox(height: 12,),
                CustomTextField(labelText: "type your Feedback",
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.send)),),
                const SizedBox(height: 12,),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Comments", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                  ],
                ),
                const SizedBox(height: 12,),
                const CommentsList()
              ],
            ),
          )
        ],
      ),
    );
  }
}


