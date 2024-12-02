import 'dart:async';

import 'package:chatbot_app/provider/chat_provider.dart';
import 'package:chatbot_app/screens/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => ChatProvider(),
              child: ChatScreen(),
            ),
          ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // child: Container(
        //     decoration:
        //     BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withBlue(170)),
            child: Image.asset(
              'assets/images/Apna_AI_Logo.png',
              width: 500,
              height: 500,
            ),
      ),
    );
  }
}