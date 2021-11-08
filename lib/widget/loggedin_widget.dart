import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:johannes_googleauth/provider/google_signin_provider.dart';
import 'package:provider/provider.dart';
class LoggenInPage extends StatefulWidget {
  const LoggenInPage({Key? key}) : super(key: key);

  @override
  _LoggenInPageState createState() => _LoggenInPageState();
}

class _LoggenInPageState extends State<LoggenInPage> {
  @override
  Widget build(BuildContext context) {
    final user  = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("LoggedIn User Page"),
        actions: [IconButton(onPressed: (){
          final provider  = Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.logOut();

        }, icon: Icon(Icons.logout))],

      ),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 40 ,
              backgroundImage: NetworkImage(user!.photoURL.toString()),
            ),

            Text(user!.displayName.toString()),
            Text(user!.phoneNumber.toString()),
            Text(user!.displayName.toString()),
            Text(user!.email.toString()),
          ],
        ),
      ),
    );
  }
}
