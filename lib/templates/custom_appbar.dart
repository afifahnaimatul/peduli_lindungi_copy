import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Function() onTap;
  CustomAppBar({@required this.onTap, Key key}) : super(key: key);
  final double appBarHeight = 50;
  get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      shadowColor: Colors.transparent,
      leading: InkWell(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back,
          color: AppColor.secondaryColor,
          size: 35,
        ),
      ),
    );
  }
}
