import 'package:flutter/material.dart';
import 'package:moviles1/widgets/loading_modal_w.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;

  final txtemail = TextFormField(
      decoration: InputDecoration(
    label: Text('Email user'),
    border: OutlineInputBorder(),
  ));
  final txtpassword = TextFormField(
      decoration: InputDecoration(
    label: Text('pasword'),
    border: OutlineInputBorder(),
  ));
  final spaceH = SizedBox(
    height: 20,
  );

  final btngoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    onPressed: () {},
  );
  final btnface = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});

  final imglogo = Image.asset(
    'assets/bitcoin.png',
    height: 200,
  );

  @override
  Widget build(BuildContext context) {
    final txtregister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Text('Crear cuenta',
            style:
                TextStyle(fontSize: 25, decoration: TextDecoration.underline)),
      ),
    );

    final btnmail = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      onPressed: () {
        isloading = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 4000)).then((value) {
          isloading = false;
          setState(() {});
          Navigator.pushNamed(context, '/dash');
        });
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 4,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/subtle-prism.png'))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    txtemail,
                    spaceH,
                    txtpassword,
                    spaceH,
                    btnmail,
                    spaceH,
                    btngoogle,
                    spaceH,
                    btnface,
                    spaceH,
                    txtregister,
                  ]),
                  Positioned(top: 100, child: imglogo)
                ],
              ),
            ),
          ),
          isloading ? const Loading_modal_w() : Container()
        ],
      ),
    );
  }
}
