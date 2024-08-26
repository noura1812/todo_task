import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/assets.dart';

class CustomCircleNetworkImage extends StatelessWidget {
  const CustomCircleNetworkImage(
      {Key? key,
      required this.imagePath,
      this.network = true,
      required this.radios,
      this.onTap,
      this.boxFit = BoxFit.cover,
      this.file = false,
      this.asset = false})
      : super(key: key);

  final double radios;
  final bool network, file, asset;
  final Function? onTap;
  final BoxFit boxFit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radios / 2),
      child: (imagePath.isEmpty)
          ? _buildPlaceholderImage()
          : (imagePath.contains('assets'))
              ? Image.asset(
                  imagePath,
                  width: radios,
                  height: radios,
                  fit: boxFit,
                )
              : (File(imagePath).existsSync())
                  ? Image.file(
                      File(imagePath),
                      width: radios,
                      height: radios,
                      fit: boxFit,
                    )
                  : CachedNetworkImage(
                      width: radios,
                      height: radios,
                      fit: boxFit,
                      imageUrl: imagePath,
                      placeholder: (_, __) => _buildPlaceholderImage(),
                      errorWidget: (_, __, ___) => _buildPlaceholderImage(),
                    ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Image.asset(
      AppAssets.userDefaultPhoto,
      width: radios,
      height: radios,
      fit: boxFit,
    );
  }
}
