import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecommercialpowertest/core/core.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;
  final bool isMale;
  const ProfileImage({
    Key? key,
    this.imageFile,
    this.imageUrl,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        fit: BoxFit.fill,
        image: AppImages.profilePicture,
        width: 120.0,
        height: 120.0,
      ),
    );
  }
}

// AppCachedNetworkImage(
//               imageUrl: imageUrl!,
//               size: const Size.square(50.0),
//             )
