import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';
import 'package:peduli_lindungi_copy/templates/app_text_style.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key key}) : super(key: key);

  @override
  _DashboardTabViewState createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topButton(),
        content(),
      ],
    );
  }

  topButton() => Container(
        height: 90,
        width: double.infinity,
        color: AppColor.whiteColor,
        padding: EdgeInsets.all(12),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: buttonText(),
        ),
      );

  buttonText() => InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Scan QR code di lokasi tujuan Anda ',
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColor.whiteColor,
            ),
            Icon(
              Icons.qr_code_scanner_rounded,
              color: AppColor.whiteColor,
            ),
          ],
        ),
      );

  content() => Stack(
        children: [
          backgroundMaps(),
          searchBar(),
        ],
      );

  backgroundMaps() => Container(
        height: MediaQuery.of(context).size.height - 200,
        decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage('assets/images/book.png'),
              fit: BoxFit.cover,
            )),
      );

  searchBar() => Container(
        height: 60,
        alignment: Alignment.center,
        margin: EdgeInsets.all(AppSize.globalMargin),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            border: InputBorder.none,
            hintText: 'Cari Zonasi..',
          ),
        ),
      );
}
