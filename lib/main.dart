import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_call/resources/auth_methods.dart';
import 'package:video_call/screens/home_screen.dart';
import 'package:video_call/screens/login_screen.dart';
import 'package:video_call/screens/video_call_screen.dart';
import 'package:video_call/utils/colors.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VideoChat',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login':(context)=> const LoginScreen(),
        '/home':(context)=> const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      //if the auth state changes then it will be used to display the changes in real time
      home: StreamBuilder(stream: AuthMethods().authChanges, builder: (context, snapshot) {
        if(snapshot.connectionState== ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasData){
          return const HomeScreen();
        }
        return const LoginScreen();
      }, ),
    );
  }
}
