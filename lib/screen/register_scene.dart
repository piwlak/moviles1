import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final txtuser = TextFormField(
  decoration: InputDecoration(
      label: Text('Nombre de Usuario'), border: OutlineInputBorder()),
);

final txtname = TextFormField(
  decoration:
      InputDecoration(label: Text('Nombre'), border: OutlineInputBorder()),
);

final txtlastname = TextFormField(
  decoration:
      InputDecoration(label: Text('Apellido'), border: OutlineInputBorder()),
);

final txtpassword = TextFormField(
  decoration:
      InputDecoration(label: Text('Apellido'), border: OutlineInputBorder()),
);

final txtemail = TextFormField(
  decoration:
      InputDecoration(label: Text('Apellido'), border: OutlineInputBorder()),
);

final txtconfpass = TextFormField(
  decoration:
      InputDecoration(label: Text('Apellido'), border: OutlineInputBorder()),
);

final btnsingup = FilledButton(onPressed: () {}, child: const Text('Sing Up'));

final imglogo = Image.asset(
  'assets/bitcoin.png',
  height: 200,
);

final spaceH = SizedBox(
  height: 20,
);

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 4,
                fit: BoxFit.cover,
                image: AssetImage('assets/subtle-prism.png'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                spaceH,
                txtname,
                spaceH,
                txtlastname,
                spaceH,
                txtuser,
                spaceH,
                txtemail,
                spaceH,
                txtpassword,
                spaceH,
                txtconfpass,
                spaceH,
                btnsingup
              ]),
              Positioned(top: 100, child: imglogo)
            ],
          ),
        ),
      ),
    );
  }
}
