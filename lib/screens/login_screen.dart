import 'package:flutter/material.dart';
import 'package:video_call/resources/auth_methods.dart';
import 'package:video_call/screens/home_screen.dart';
import 'package:video_call/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods= AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text('Start or join the meeting',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:38.0),
          child: Image.asset('assets/images/onBoarding.jpg'),
        ),
        CustomButton(text: "Sign in", onPressed:() async{
          bool res = await _authMethods.signInWithGoogle(context);
          if(res)
          {
            Navigator.push(context,new MaterialPageRoute(builder: (context)=> new HomeScreen()));
          }
        } )
      ]),
    );
  }
}