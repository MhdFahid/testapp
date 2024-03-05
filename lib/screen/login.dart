import 'package:app/common_widgets/common_button.dart';
import 'package:app/common_widgets/common_textfield.dart';
import 'package:app/constat.dart';
import 'package:app/controllers/log_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://d3nn873nee648n.cloudfront.net/1200x1800-new/20813/SM1072531.jpg'))),
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            space,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    'Login Or Register To Book Your Appointments ',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  space,
                  CommenTextField(
                    controller: loginController.usernameController,
                    title: 'Username',
                    hintText: 'Enter your username',
                  ),
                  space,
                  CommenTextField(
                    controller: loginController.usernameController,
                    title: 'Password',
                    hintText: 'Enter password',
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CommonButton(
                    title: 'Login',
                    onTap: () async {
                      await loginController.login();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
