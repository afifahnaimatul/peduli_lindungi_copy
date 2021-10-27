import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/pages/auth/login_first.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/custom_button.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';

class SeconIntro extends StatelessWidget {
  const SeconIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlueColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 150),
              Container(
                height: 300,
                // width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/second_intro.png'),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Text(
                  'Mulai peduli untuk lindungi diri dan mereka yang tercinta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: CustomButton(
                onTap: () => showBottomSheet(context), text: 'MULAI'),
          ),
        ],
      ),
    );
  }

  // templateButton(context) =>

  showBottomSheet(context) => showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Syarat Penggunaan & Kebijakan Privasi',
                      style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(Icons.close_sharp),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 12),
              Text(
                'PeduliLindungi telah memperbarui syarat penggunaan dan kebijakan privasi',
                style: TextStyle(
                  color: AppColor.secondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Syarat Penggunaan dan Kebijakan Privasi merupakan ketentuan yang harus dibaca, dipahami, dan disetujui oleh Pengguna sebelum mengakses atau menggunakan aplikasi PeduliLindungi. Lihat Syarat Penggunaan dan Kebijakan Privasi di sini:',
                style: TextStyle(
                  color: AppColor.blackColor,
                ),
              ),
              ListTile(
                leading: Container(
                  child: Icon(
                    Icons.circle,
                    size: 10,
                  ),
                ),
                title: new Text(
                  'Syarat Penggunaan',
                  style: TextStyle(fontSize: 10),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Container(
                  child: Icon(
                    Icons.circle,
                    size: 10,
                  ),
                ),
                title: new Text(
                  'Kebijakan Privasi',
                  style: TextStyle(fontSize: 10),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Dengan menyatakan Setuju, Anda menerima segala isi Syarat Penggunaan dan Kebijakan Privasi yang baru.',
                style: TextStyle(
                  color: AppColor.blackColor,
                ),
              ),
              SizedBox(height: 24),
              CustomButton(
                  onTap: () {
                    nextReplacementScreen(context, LoginFirst());
                  },
                  text: 'SAYA SETUJU'),
            ],
          ),
        );
      });
}
