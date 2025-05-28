import 'package:flutter/material.dart';

import 'common_shimmer.dart';

class CommonImage extends StatelessWidget {
  
  const CommonImage(
    this.name,
    {
      super.key, 
      this.height,
      this.width, 
      this.fit,
      this.radius = 0.0,
      this.backgroundColor,
      this.color,
      this.borderColor = Colors.black,
      this.border = 0.0,
      this.errorWidget,
      this.padding
    }
  );

  final String name;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final Color? color;
  final Color? backgroundColor;

  final double border;
  final Color borderColor;
  final Widget? errorWidget;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: border == 0.0 ? null : Border.fromBorderSide(
          BorderSide(
            color: borderColor,
            width: border
          ),
        ),
        color: backgroundColor
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: _buildImage()
        )
      ),
    );
  }

  Widget _buildImage() {

    return Image.asset(
      name,
      height: height, 
      width: width, 
      fit: fit,
      color: color,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        return _loading();
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? _errorWidget();
      }
    );
  }

  Widget _loading() {
    return Center(
      child: CommonShimmer(
        height: height ?? 0.0,
        width: width,
        borderRadius: BorderRadius.circular(radius),
      )
    );
  }

  Widget _errorWidget() {

    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.grey.shade200,
      ),
      child: Icon(Icons.error_rounded, color: Colors.red, size: 24.0)
    );
  }
}

