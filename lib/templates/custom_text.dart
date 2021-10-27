import 'package:flutter/cupertino.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color = AppColor.blackColor;
  TextStyle style;
  TextAlign textAlign;
  TextDirection textDirection;
  TextOverflow overflow;
  int maxLines;

  CustomText({
    @required this.text,
    this.color,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // style: style?? ,
    );
  }
}
