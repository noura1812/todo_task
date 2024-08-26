import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/assets.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.onTap,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function? onTap;
  final BoxFit boxFit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) {
      return _buildPlaceholderImage();
    } else if (imagePath.contains('assets')) {
      return Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: boxFit,
      );
    } else if (File(imagePath).existsSync()) {
      return Image.file(
        File(imagePath),
        width: width,
        height: height,
        fit: boxFit,
      );
    } else {
      return CachedNetworkImage(
        width: width,
        height: height,
        fit: boxFit,
        imageUrl: imagePath,
        placeholder: (_, __) => _buildPlaceholderImage(),
        errorWidget: (_, __, ___) => _buildPlaceholderImage(),
      );
    }
  }

  Widget _buildPlaceholderImage() {
    return Image.asset(
      AppAssets.userDefaultPhoto,
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
