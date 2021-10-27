import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/custom_appbar.dart';
import 'package:peduli_lindungi_copy/templates/custom_button.dart';
import 'package:peduli_lindungi_copy/templates/custom_permission.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginOTP extends StatefulWidget {
  const LoginOTP({Key key}) : super(key: key);

  @override
  _LoginOTPState createState() => _LoginOTPState();
}

class _LoginOTPState extends State<LoginOTP> {
  @override
  void initState() {
    stateTimerStart();
    // TODO: implement initState
    super.initState();
  }

  DateTime timerr = DateTime.parse("2021-09-09 00:02:00");
  var sCount = 0;

  Timer _timer;
  void stateTimerStart() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sCount < 120) {
        sCount++;
        setState(() {
          timerr = timerr.subtract(Duration(seconds: 1));
        });
      } else {
        _timer.cancel();
      }
    });
    //});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: CustomAppBar(onTap: () => backScreen(context)),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            titleText(
                'Masukkan 6 digit kode verifikasi yang dikirimkan ke +62...'),
            SizedBox(height: 30),
            Container(
              width: 320,
              child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                    colorBuilder: FixedColorBuilder(Colors.black)),
              ),
            ),
            SizedBox(height: 30),
            resendOTP(),
            SizedBox(height: 130),
            changeNumber(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: CustomButton(
                        onTap: () {
                          nextPage(context, CustomPermission(mode: 'location'));
                        },
                        text: 'VERIFIKASI'),
                  ),
                ],
              ),
            )
          ],
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

  resendOTP() => RichText(
        text: TextSpan(
            text: 'Kirim ulang ',
            style: TextStyle(color: AppColor.grayColor, fontSize: 14),
            children: [
              TextSpan(
                  text: DateFormat('mm:ss').format(timerr),
                  style: TextStyle(color: AppColor.darkGrayColor))
            ]),
      );

  changeNumber() => InkWell(
        onTap: () {
          backScreen(context);
        },
        child: Text(
          'Ubah Nomor Telepon',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 18,
          ),
        ),
      );
}
