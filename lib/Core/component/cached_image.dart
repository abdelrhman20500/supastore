import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'custom_circular_progress_indicator.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.url,});

  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 250,
      width: double.infinity,
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) => const CustomCircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}