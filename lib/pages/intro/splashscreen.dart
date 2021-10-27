import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/pages/intro/wizard.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToNextPage();
  }

  navigateToNextPage() async {
    await Future.delayed(Duration(milliseconds: 1500));
    nextReplacementScreen(context, Wizard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(AppSize.globalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 250),
            Center(
              child: Image(
                image: AssetImage("assets/images/splash.png"),
                height: 150,
              ),
            ),
            SizedBox(height: 250),
            Text('Bekerjasama dengan:'),
            SizedBox(height: 16),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
