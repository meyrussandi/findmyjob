import 'package:email_validator/email_validator.dart';
import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/providers/auth_provider.dart';
import 'package:findmyjob/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => false);
                              },
                              child: Icon(Icons.arrow_back)),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Build Your Career',
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset(
                        'assets/loginimage.jpg',
                        width: 260,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: greyTextFont.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: emailController,
                          cursorColor: mainColor,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 28, bottom: 20, top: 20),
                            fillColor: Color(0xffF1F0F5),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: EmailValidator.validate(
                                        emailController.text)
                                    ? blackColor
                                    : mainColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: '',
                          ),
                          style: EmailValidator.validate(emailController.text)
                              ? blackTextFont
                              : mainTextFont,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: greyTextFont.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: passwordController,
                                cursorColor: blackColor,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 28, bottom: 20, top: 20),
                                  fillColor: Color(0xffF1F0F5),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: blackColor,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: '',
                                ),
                                style: blackTextFont,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: isLoading
                              ? SpinKitSquareCircle(
                                  size: 50,
                                  color: mainColor,
                                )
                              : FloatingActionButton(
                                  onPressed: emailController.text.isEmpty ||
                                          passwordController.text.isEmpty
                                      ? null
                                      : () async {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          LoginRegisterResult result =
                                              await authProvider.login(
                                                  emailController.text,
                                                  passwordController.text);

                                          if (result.userModel == null) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor: mainColor,
                                                    content: Text(
                                                      result.message,
                                                      style: whiteTextFont,
                                                    )));
                                          } else {
                                            userProvider.user =
                                                result.userModel;
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/home',
                                                (route) => false);
                                          }
                                        },
                                  backgroundColor: (emailController.text.isEmpty || !EmailValidator.validate(emailController.text)) ||
                                      passwordController.text.isEmpty?greyColor:mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do not have account? ",
                              style: greyTextFont,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  "Register",
                                  style: blackTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
