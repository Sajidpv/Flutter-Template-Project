// import 'dart:io';

// import 'package:ayaboo_user/utils/constants/enums.dart';
// import 'package:ayaboo_user/utils/constants/sizes.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomRoundedImage extends StatelessWidget {
//   const CustomRoundedImage(
//       {super.key,
//       this.applyImageRadius = true,
//       this.border,
//       this.borderRadius,
//       this.width,
//       this.height,
//       this.padding,
//       this.margin,
//       this.fit = BoxFit.cover,
//       this.image,
//       this.file,
//       required this.imageType,
//       this.overlayColor,
//       this.backgroundColor,
//       this.memoryImage});
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final double? borderRadius, width, height, padding;
//   final double? margin;
//   final BoxFit? fit;
//   final String? image;
//   final File? file;
//   final ImageType imageType;
//   final Color? overlayColor, backgroundColor;
//   final Uint8List? memoryImage;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       margin: EdgeInsets.all(margin ?? 0),
//       padding: EdgeInsets.all(padding ?? 0),
//       decoration: BoxDecoration(
//         border: border,
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.md),
//       ),
//       child: _buildImageWidget(),
//     );
//   }

//   Widget _buildImageWidget() {
//     Widget imageWidget;
//     switch (imageType) {
//       case ImageType.network:
//         imageWidget = _buildNetworkImage();
//         break;
//       case ImageType.memory:
//         imageWidget = _buildMemoryImage();
//         break;
//       case ImageType.file:
//         imageWidget = _buildFileImage();
//         break;
//       case ImageType.asset:
//         imageWidget = _buildAssetImage();
//         break;
//       case ImageType.svg:
//         imageWidget = _buildSvgImage();
//         break;
//     }

//     return ClipRRect(
//       borderRadius: applyImageRadius
//           ? BorderRadius.circular(borderRadius ?? AppSizes.md)
//           : BorderRadius.zero,
//       child: imageWidget,
//     );
//   }

//   Widget _buildSvgImage() {
//     if (image != null) {
//       return SvgPicture.asset(
//         image!,
//         fit: fit!,
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget _buildAssetImage() {
//     if (image != null) {
//       return Image(
//         image: AssetImage(image!),
//         fit: fit,
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget _buildFileImage() {
//     if (file != null) {
//       return Image(
//         image: FileImage(file!),
//         fit: fit,
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget _buildMemoryImage() {
//     if (memoryImage != null) {
//       return Image(
//         image: MemoryImage(memoryImage!),
//         fit: fit,
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget _buildNetworkImage() {
//     if (image != null) {
//       return CachedNetworkImage(
//         imageUrl: image!,
//         fit: fit,
//         color: overlayColor,
//         errorWidget: (context, url, error) => const Icon(Icons.error),
//         progressIndicatorBuilder: (context, url, progress) =>
//             const CircularProgressIndicator(),
//       );
//     } else {
//       return Container();
//     }
//   }
// }
