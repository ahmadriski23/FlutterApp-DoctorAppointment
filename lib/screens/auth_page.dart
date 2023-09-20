import 'package:doctor_appointment_app/components/login_form.dart';
import 'package:doctor_appointment_app/components/social_button.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              AppText.enText['welcome_text']!,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Text(
              AppText.enText['signIn_text']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // * Logo Disini Gantiin SizedBox
            SizedBox(
              height: 160,
            ),
            const LoginForm(),
            Config.spaceSmall,
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppText.enText['forgot-password']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                AppText.enText["social-login"]!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
            ),
            Config.spaceSmall,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(
                    imageNetwork:
                        'https://i.pinimg.com/236x/44/a9/7c/44a97c0effefa86b75a53184fdb54023.jpg',
                    name: 'Google'),
                SocialButton(
                    imageNetwork:
                        'https://i.pinimg.com/564x/5b/ee/52/5bee52fa1411082205d151a185650658.jpg',
                    name: 'Facebook'),
              ],
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.enText['signUp_text']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
