import 'package:flutter/material.dart';

enum StyleEnum {
  title,
  smallTitle,
  p1,
  p2,
  button,
  caption,
}

class AppText extends StatelessWidget {
  const AppText.title(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.height,
    this.fontStyle,
    this.fontSize,
  }) : enumStyle = StyleEnum.title;

  const AppText.smallTitle(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.height,
    this.fontStyle,
    this.fontSize,
  }) : enumStyle = StyleEnum.smallTitle;

  const AppText.p1(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.height,
    this.fontStyle,
    this.fontSize,
  }) : enumStyle = StyleEnum.p1;

  const AppText.p2(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.height,
    this.fontStyle,
    this.fontSize,
  }) : enumStyle = StyleEnum.p2;

  const AppText.button(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.height,
    this.fontStyle,
    this.fontSize,
  }) : enumStyle = StyleEnum.button;

  const AppText.caption(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.height,
    this.fontStyle,
    this.fontSize,
  }) : enumStyle = StyleEnum.caption;

  final String data;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final StyleEnum enumStyle;
  final double? height;
  final FontStyle? fontStyle;
  final double? fontSize;

  @override
  Text build(BuildContext context) {
    final style = () {
      switch (enumStyle) {
        case StyleEnum.title:
          return Theme.of(context).textTheme.titleLarge;
        case StyleEnum.smallTitle:
          return Theme.of(context).textTheme.titleMedium;
        case StyleEnum.p1:
          return Theme.of(context).textTheme.titleSmall;
        case StyleEnum.p2:
          return Theme.of(context).textTheme.bodyLarge;
        case StyleEnum.button:
          return Theme.of(context).textTheme.labelLarge;
        case StyleEnum.caption:
          return Theme.of(context).textTheme.bodySmall;
      }
    }();

    return Text(
      data,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: style!.copyWith(
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        height: height,
        fontStyle: fontStyle,
        fontSize: fontSize,
      ),
    );
  }
}
