import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User Name", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("comment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Replay...", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Replay...", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          ],
        ),
      ],
    );
  }
}
