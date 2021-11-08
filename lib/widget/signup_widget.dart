import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:johannes_googleauth/provider/google_signin_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 50)
              ),
              onPressed: (){
                final provider  = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();

              },
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
              label: Text("Signup With Google")),
        ),
      ),
    );
  }
}
