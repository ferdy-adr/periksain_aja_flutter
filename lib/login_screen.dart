import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periksain_aja_flutter/home_screen.dart';
import 'package:periksain_aja_flutter/data/user_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _tempUsername;
  String? _tempPassword;
  bool _isAuth = false;

  @override
  Widget build(BuildContext context) {
    Size? screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: (screenSize.width <= 600)
                    ? 32.0
                    : (screenSize.width <= 800)
                        ? 80.0
                        : (screenSize.width <= 1100)
                            ? 160.0
                            : (screenSize.width <= 1300)
                                ? 250.0
                                : 400.0,
                vertical: (screenSize.height <= 700)
                    ? 30.0
                    : (screenSize.height <= 800)
                        ? 50.0
                        : 80.0,
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
                      onChanged: (inputUsername) {
                        for (var i = 0; i < userAccountList.length; i++) {
                          if (inputUsername == userAccountList[i][0]) {
                            setState(() {
                              _tempUsername = inputUsername;
                            });
                            break;
                          } else {
                            setState(() {
                              _tempUsername = null;
                            });
                          }
                        }
                      },
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
                      onChanged: (inputPassword) {
                        setState(() {
                          _tempPassword = inputPassword;
                        });
                      },
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
                                // Authentication Logic
                                for (var i = 0;
                                    i < userAccountList.length;
                                    i++) {
                                  if (_tempUsername == userAccountList[i][0] &&
                                      _tempPassword == userAccountList[i][1]) {
                                    setState(() {
                                      _isAuth = true;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                          userId: userAccountList[i][0],
                                          userName: userAccountList[i][2],
                                          appointment: [userAccountList[i][3]],
                                        ),
                                      ),
                                    );
                                    break;
                                  } else {
                                    setState(() {
                                      _isAuth = false;
                                    });
                                  }
                                }

                                if (_isAuth != true) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Alert!'),
                                      content: Text(
                                        (_tempUsername == null)
                                            ? 'Your ID is incorrect'
                                            : 'Your Password is incorrect',
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
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
