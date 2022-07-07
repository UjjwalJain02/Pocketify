import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pocketify/app_color.dart';
import 'package:pocketify/home.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Home()),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash.png'),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Pocketify",
                style: TextStyle(
                    color: AppColor.fabLight,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Get expense insights",
                style: TextStyle(color: AppColor.fabLight, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
