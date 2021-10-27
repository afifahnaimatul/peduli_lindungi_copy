import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function() onTap;
  bool disabled = false;
  CustomButton(
      {@required this.onTap,
      @required this.text,
      this.disabled = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (disabled) ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: (disabled) ? AppColor.lightGrayColor : AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: (disabled) ? AppColor.grayColor : AppColor.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
    ;
  }
}
