import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:peduli_lindungi_copy/pages/intro/second_intro.dart';
import 'package:peduli_lindungi_copy/pages/intro/splashscreen.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';

class Wizard extends StatelessWidget {
  Wizard({Key key}) : super(key: key);

  var wizardData = [
    {
      'image': 'assets/images/stars.png',
      'title': 'Bantu melacak penyebaran COVID-19',
      'excerpt':
          'Melacak penyebaran COVID-19 untuk membantu pemerintah menghentikan penyebaran Coronavirus Disease (COVID-19).',
      'using_kebijakan_privasi': false,
    },
    {
      'image': 'assets/images/stars.png',
      'title': 'Informasi Zona dan Notifikasi Keramaian',
      'excerpt':
          'Dapatkan informasi zonasi persebaran COVID-19 sesuai lokasi yang dipilih.',
      'using_kebijakan_privasi': false,
    },
    {
      'image': 'assets/images/stars.png',
      'title': 'Periksa kesehatan & vaksin COVID-19',
      'excerpt':
          'Konsultasi kesehatan dengan layanan Teledokter atau daftarkan diri dalam program vaksinasi COVID-19 di sini.',
      'using_kebijakan_privasi': false,
    },
    {
      'image': 'assets/images/stars.png',
      'title': 'Notifikasi zona risiko COVID-19',
      'excerpt':
          'Dapatkan notifikasi dan informasi aktual terkait paparan Covid-19 di lokasi Anda dengan memberikan akses lokasi.',
      'using_kebijakan_privasi': true,
    },
    {
      'image': 'assets/images/stars.png',
      'title': 'Pindai QR Code & cek tiket vaksinasi',
      'excerpt':
          'Dukung program peerntah dalam tracing & tracking dengan memberikan akses kamera, penyimpanan, foto dan media untuk unduk sertifikat vaksin & scan QR Code di gedung/tenant.',
      'using_kebijakan_privasi': true,
    },
  ];

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SeconIntro()),
      // MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = TextStyle(fontSize: 15.0, color: AppColor.blackColor);
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        color: AppColor.secondaryColor,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: wizardData[0]['title'],
          body: wizardData[0]['excerpt'],
          image: _buildImage('images/stars'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: wizardData[1]['title'],
          body: wizardData[1]['excerpt'],
          image: _buildImage('images/stars'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: wizardData[2]['title'],
          body: wizardData[2]['excerpt'],
          image: _buildImage('images/stars'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: wizardData[3]['title'],
          // body: wizardData[3]['excerpt'],
          bodyWidget: Column(
            children: [
              Text(
                wizardData[3]['excerpt'],
                style: bodyStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selengkapnya pelajari lebih lanjut ",
                    style: TextStyle(
                      color: AppColor.grayColor,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Kebijakan Privasi',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          image: _buildImage('images/stars'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: wizardData[4]['title'],
          // body: wizardData[4]['excerpt'],
          bodyWidget: Column(
            children: [
              Text(
                wizardData[4]['excerpt'],
                style: bodyStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selengkapnya pelajari lebih lanjut ",
                    style: TextStyle(
                      color: AppColor.grayColor,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Kebijakan Privasi',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          image: _buildImage('images/stars'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      // showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      // skip: Text('Skip'),
      next: Container(
        width: 60,
        height: 60,
        child: Icon(
          Icons.arrow_forward,
          color: AppColor.whiteColor,
          size: 40,
        ),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(50)),
      ),
      done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        size: Size(12.0, 12.0),
        color: Color(0xFFBDBDBD),
        activeColor: AppColor.primaryColor,
        activeSize: Size(12.0, 12.0),
        // activeShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
        // ),
      ),
    );

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     // backgroundColor: AppColor.primaryColor,
    //     body: Container(
    //       // height: MediaQuery.of(context).size.height,
    //       // width: MediaQuery.of(context).size.width,
    //       // padding: EdgeInsets.all(3 * AppSize.globalMargin),
    //       // child: Expanded(
    //       child: Stack(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.all(36),
    //             child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: wizardData.length,
    //               itemBuilder: (context, index) {
    //                 return wizardContent(
    //                   wizardData[index]['image'],
    //                   wizardData[index]['title'],
    //                   wizardData[index]['excerpt'],
    //                   wizardData[index]['using_kebijakan_privasi'],
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //       // ),
    //     ),
    //   );
  }

  wizardContent(String image, String title, String excerpt,
          bool using_kebijakan_privasi) =>
      Container(
        // padding: EdgeInsets.all(3 * AppSize.globalMargin),
        child: Column(
          children: [
            Image(
              image: AssetImage(image),
              height: 300,
            ),
            SizedBox(height: 30),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Text(
              excerpt,
              textAlign: TextAlign.center,
              // overflow: TextOverflow.clip,
            ),
          ],
        ),
      );
}
