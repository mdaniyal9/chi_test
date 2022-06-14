import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CHINetworkImage extends StatelessWidget {
  final String? imageURL;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const CHINetworkImage(this.imageURL,
      {Key? key, this.height = 40, this.width = 40, this.fit = BoxFit.cover, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL == 'null' || imageURL == null || imageURL == '' ? 'https://cdn-icons-png.flaticon.com/512/1159/1159671.png' : imageURL!,
      height: height!,
      width: width!,
      fit: fit,
      placeholder: (context, url) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'assets/images/no_image.png',
          height: height!,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
      color: color,
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'assets/images/no_image.png',
          height: height!,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
