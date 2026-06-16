
import 'package:flutter/material.dart';

import '../../../../../Core/component/product_list.dart';
import '../../../../../Core/functions/build_app_bar.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "MyOrders"),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: ProductList(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
        ),
      ),
    );
  }
}
