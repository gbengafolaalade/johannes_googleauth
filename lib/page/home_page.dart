import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:johannes_googleauth/widget/loggedin_widget.dart';
import 'package:johannes_googleauth/widget/signup_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator.adaptive(),);
          }else if(snapshot.hasData){
            return LoggenInPage();

          }else if(snapshot.hasError){
            return Center(child: Text("Something went wrong"),);
          }else{
            return SignupPage();
          }
        },
      ),

    );
  }
}
