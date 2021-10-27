import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/pages/auth/login_otp.dart';
import 'package:peduli_lindungi_copy/pages/auth/register_first.dart';
import 'package:peduli_lindungi_copy/pages/intro/second_intro.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';
import 'package:peduli_lindungi_copy/templates/custom_button.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';

class LoginFirst extends StatelessWidget {
  final phoneNumController = TextEditingController();
  final emailController = TextEditingController();
  LoginFirst({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: () => backScreen(context),
          // onTap: () => popUntil(context, SeconIntro()),
          child: Icon(
            Icons.arrow_back,
            color: AppColor.secondaryColor,
            size: 35,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          padding: EdgeInsets.fromLTRB(AppSize.globalMargin, 0,
              AppSize.globalMargin, AppSize.globalMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Masuk'),
              SizedBox(height: 16),
              excerptText(
                  'Pilih satu cara untuk masuk menggunakan alamat email atau nomor telepon yang terdaftar.'),
              SizedBox(height: 16),
              buildTabBar(context),
              tabBarContent(context),
              bottomButton(context),
            ],
          ),
        ),
      ),
    );
  }

  titleText(String text) => Text(
        text,
        style: TextStyle(
          color: AppColor.secondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        ),
      );

  excerptText(String text) => Text(
        text,
        style: TextStyle(
          color: AppColor.grayColor,
          fontSize: 16,
        ),
      );

  goToRegister(context) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 12),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: AppColor.blackColor, fontSize: 16),
            text: 'Belum Punya Akun PeduliLindungi?  ',
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      nextPage(context, RegisterFirst());
                    },
                  text: 'Daftar',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w700))
            ],
          ),
        ),
      );

  buildTabBar(context) => Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.lightGrayColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: tabBarTitle(),
      );

  tabBarTitle() => TabBar(
          unselectedLabelColor: AppColor.grayColor,
          labelColor: AppColor.blackColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.whiteColor),
          tabs: [
            tabStyle('Nomor Telepon'),
            tabStyle('Alamat Email'),
          ]);

  tabStyle(String text) => Tab(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
            ),
          ),
        ),
      );

  tabBarContent(context) => Expanded(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            phoneForm(),
            emailForm(),
          ]),
        ),
      );

  bottomButton(context) => Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 48),
            child: CustomButton(
              onTap: () {
                nextPage(context, LoginOTP());
              },
              text: 'MASUK',
            ),
          ),
          goToRegister(context),
        ],
      );

  phoneForm() => Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Telepon',
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            phoneField(),
          ],
        ),
      );

  emailForm() => Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Email',
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.lightGrayColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: emailController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Masukkan Email Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );

  phoneField() => Row(
        children: [
          Container(
            width: 130,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.lightGrayColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              readOnly: true,
              controller: TextEditingController()..text = ' +62',
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.access_alarm, size: 30),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.lightGrayColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneNumController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Nomor Telepon',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
}
