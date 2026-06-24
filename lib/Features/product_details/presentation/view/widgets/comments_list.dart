import 'package:flutter/material.dart';
import 'package:supastore/Features/product_details/presentation/view/widgets/user_comment.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index){
        return const UserComment();
      },
      separatorBuilder:(context, index)=>const Divider(),);
  }
}
