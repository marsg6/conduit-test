import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomCachedNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) => imageUrl != null
      ? CachedNetworkImage(
          imageUrl: imageUrl!,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          placeholder: placeholder != null ? (_, __) => placeholder! : null,
          errorWidget: errorWidget != null
              ? (_, __, ___) => errorWidget!
              : (_, __, ___) => const _NoImage(),
        )
      : SizedBox(
          width: width,
          height: height,
          child: errorWidget ?? const _NoImage(),
        );
}

class _NoImage extends StatelessWidget {
  const _NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Icon(
              Icons.error_outline,
              size: constraints.maxWidth * 0.5,
            );
          },
        ),
      ),
    );
  }
}
