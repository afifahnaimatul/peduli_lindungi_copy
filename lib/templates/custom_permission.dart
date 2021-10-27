import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/pages/dashboard/dashboard.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';
import 'package:peduli_lindungi_copy/templates/custom_button.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';

class CustomPermission extends StatefulWidget {
  String mode;
  CustomPermission({@required this.mode, Key key}) : super(key: key);

  @override
  _CustomPermissionState createState() => _CustomPermissionState();
}

class _CustomPermissionState extends State<CustomPermission> {
  String image;
  String title;
  String description;
  String urlPermission;
  Function() goToNextPage;

  @override
  void initState() {
    setContent();
    // TODO: implement initState
    super.initState();
  }

  setContent() {
    switch (widget.mode) {
      case 'location':
        image = 'assets/images/stars.png';
        title = 'Aktifkan lokasi Anda';
        description =
            'PeduliLindungi membutuhkan izin untuk mengaktifkan akses lokasi Anda setiap waktu di belakang layar untuk dapat melihat aktivitas dan memberikan informasi terkait paparan COVID-19 di sekitar Anda.';
        urlPermission = 'https://google.com';
        goToNextPage = () =>
            nextReplacementScreen(context, CustomPermission(mode: 'media'));
        break;

      case 'media':
        image = 'assets/images/stars.png';
        title = 'Akses Foto, Media & File';
        description =
            'Untuk mengganti foto profil yang diinginkan atau menyimpan tiket dan sertifikat vaksinasi COVID-19, PeduliLindungi membutuhkan akses penyimpanan ke dalam perangkat Anda.';
        urlPermission = 'https://google.com';
        goToNextPage = () =>
            nextReplacementScreen(context, CustomPermission(mode: 'camera'));
        break;

      case 'camera':
        image = 'assets/images/stars.png';
        title = 'Akses Kamera';
        description =
            'Untuk dapat masuk ke dalam gedung atau tempat umum yang bekerjasama, PeduliLindungi membutuhkan akses kamera Anda untuk memindai QR Code pada gedung/tenant dan juga mengganti foto profil Anda secara langsung.';
        urlPermission = 'https://google.com';
        goToNextPage = () => nextReplacementScreen(context, Dashboard());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(AppSize.globalMargin),
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
              description,
              textAlign: TextAlign.center,
              // overflow: TextOverflow.clip,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomButton(onTap: goToNextPage, text: 'SELANJUTNYA'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
