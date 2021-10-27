import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peduli_lindungi_copy/pages/auth/login_first.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';
import 'package:peduli_lindungi_copy/templates/custom_button.dart';
import 'package:peduli_lindungi_copy/templates/custom_permission.dart';
import 'package:peduli_lindungi_copy/templates/routes.dart';

class RegisterFirst extends StatefulWidget {
  RegisterFirst({Key key}) : super(key: key);

  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  final phoneNumController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: () => backScreen(context),
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
              titleText('Daftar'),
              SizedBox(height: 16),
              excerptText(
                  'Pilih satu cara untuk mendaftar menggunakan alamat email atau nomor telepon.'),
              SizedBox(height: 16),
              buildTabBar(context),
              tabBarContent(context),
              bottomButton(),
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

  goToRegister() => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 12),
        child: RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => () {},
            style: TextStyle(color: AppColor.blackColor, fontSize: 16),
            text: 'Sudah Punya Akun PeduliLindungi?  ',
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      nextReplacementScreen(context, LoginFirst());
                    },
                  text: 'Masuk',
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

  bottomButton() => Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 48),
            child: CustomButton(
              onTap: () {
                // print(nameController.text.toString().isNotEmpty);
                print(((nameController.text.toString().isNotEmpty) &&
                    (phoneNumController.text.toString().isNotEmpty ||
                        emailController.text.toString().isNotEmpty) &&
                    !isChecked));
                print('space');
                print('name');
                print(nameController.text.toString().isNotEmpty);
                print('phone');
                print(phoneNumController.text.toString().isNotEmpty);
                print('email');
                print(emailController.text.toString().isNotEmpty);
                print('name or email');
                print(phoneNumController.text.toString().isNotEmpty ||
                    emailController.text.toString().isNotEmpty);
                print('agreed');
                print(isChecked);
                print((nameController.text.toString().isEmpty ||
                    (phoneNumController.text.toString().isEmpty &&
                        emailController.text.toString().isEmpty) ||
                    !isChecked));

                nextPage(context, CustomPermission(mode: 'location'));
              },
              text: 'DAFTAR',
              disabled: !isChecked,
              // disabled: nameController.text.toString().isEmpty ||
              //     (phoneNumController.text.toString().isEmpty &&
              //         emailController.text.toString().isEmpty) ||
              //     !isChecked,
              // disabled: (nameController.text.toString().isNotEmpty) &&
              //     (phoneNumController.text.toString().isNotEmpty ||
              //         emailController.text.toString().isNotEmpty) &&
              //     isChecked,
            ),
          ),
          goToRegister(),
        ],
      );

  phoneForm() => Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            nameField(TextInputType.name, 'Nama Lengkap', nameController),
            SizedBox(height: 24),
            Text(
              'Nomor Telepon',
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            phoneField(),
            SizedBox(height: 24),
            acceptanceBox(),
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
            child: nameField(
                TextInputType.number, 'Nomor Telepon', phoneNumController),
          ),
        ],
      );

  emailForm() => Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            nameField(TextInputType.name, 'Nama Lengkap', nameController),
            SizedBox(height: 24),
            Text(
              'Alamat Email',
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            nameField(TextInputType.emailAddress, 'Masukkan Email Anda',
                emailController),
            SizedBox(height: 24),
            acceptanceBox(),
          ],
        ),
      );

  nameField(
          TextInputType type, String text, TextEditingController controller) =>
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
          keyboardType: type,
          controller: controller,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
          ),
        ),
      );

  acceptanceBox() => Row(
        children: [
          Checkbox(
              value: isChecked,
              onChanged: (bool value) {
                setState(() {
                  isChecked = value;
                });
              }),
          Expanded(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              text: TextSpan(
                style: TextStyle(color: AppColor.blackColor, fontSize: 16),
                text: 'Saya menerima segala isi ',
                children: [
                  TextSpan(
                    text: 'Syarat Penggunaan ',
                    recognizer: TapGestureRecognizer()..onTap = () => () {},
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                  TextSpan(text: 'dan '),
                  TextSpan(
                    text: 'Kebijakan Privasi ',
                    recognizer: TapGestureRecognizer()..onTap = () => () {},
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                  TextSpan(text: 'PeduliLindungi')
                ],
              ),
            ),
          ),
        ],
      );
}
