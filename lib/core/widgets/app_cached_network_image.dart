import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final Size? size;
  const AppCachedNetworkImage({Key? key, required this.imageUrl, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      memCacheWidth: size?.width == null ? 0 : size?.width.toInt(),
      memCacheHeight: size?.height == null ? 0 : size?.height.toInt(),
      maxHeightDiskCache: size?.height == null ? 0 : size?.height.toInt(),
      maxWidthDiskCache: size?.width == null ? 0 : size?.width.toInt(),
      width: size?.width,
      height: size?.height,
      imageUrl: imageUrl!,
      placeholder: (context, _) => RowBoxLoading(
        itemCount: 1,
        itemSize: size,
      ),
      errorWidget: (context, _, __) => Image(
        image: AppImages.logo,
        width: size?.width,
        height: size?.height,
      ),
    );
  }
}
