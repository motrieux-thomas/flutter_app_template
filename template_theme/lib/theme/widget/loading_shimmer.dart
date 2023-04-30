import 'package:flutter/material.dart';
import 'package:template_theme/theme/data/theme_data.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingShimmer extends StatelessWidget {
  const AppLoadingShimmer._({
    super.key,
    this.width,
    this.height,
    this.decoration,
    this.isExpanded = false,
    this.padding = EdgeInsets.zero,
  });

  final double? width;
  final double? height;
  final Decoration? decoration;
  final bool isExpanded;
  final EdgeInsets padding;

  factory AppLoadingShimmer({
    Key? key,
    Decoration? decoration,
    EdgeInsets? padding,
    required double width,
    required double height,
  }) {
    return AppLoadingShimmer._(
      key: key,
      height: height,
      width: width,
      decoration: decoration,
      padding: padding ?? EdgeInsets.zero,
    );
  }

  factory AppLoadingShimmer.expanded({
    Key? key,
    Decoration? decoration,
    EdgeInsets? padding,
  }) {
    return AppLoadingShimmer._(
      key: key,
      height: null,
      width: null,
      decoration: decoration,
      padding: padding ?? EdgeInsets.zero,
      isExpanded: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultDecoration = BoxDecoration(
      color: theme.colors.shimmerBase,
      borderRadius: BorderRadius.all(theme.radius.large),
    );

    final Widget wrapper = Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: theme.colors.shimmerBase,
        highlightColor: theme.colors.shimmerHighlight,
        child: Container(decoration: decoration ?? defaultDecoration),
      ),
    );

    if (isExpanded) return Expanded(child: wrapper);
    return SizedBox(height: height, width: width, child: wrapper);
  }
}
