import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periksain_aja_flutter/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: SvgPicture.asset(
                      'assets/images/login-illustration.svg',
                      height: 160,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        labelText: 'Your ID',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your ID',
                        hintStyle: const TextStyle(fontSize: 14.0),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(fontSize: 14.0),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Create account!',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 0.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      'Or sign in with',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20,
                            child: Image.asset(
                              'assets/images/google_icon.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20,
                            child: Image.asset(
                              'assets/images/facebook_icon.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20,
                            child: Image.asset(
                              'assets/images/twitter_icon.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
