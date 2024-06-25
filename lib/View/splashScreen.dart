import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/Controller/splashController.dart';
import 'package:newsapp/Utils/textTheme.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(const Duration(seconds: 8),(){
      splashScreenProvider.setLoading(false);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("NEWS TODAY",
            style: NewsText.textMainSP,
            ),
            if(splashScreenProvider.isLoading)
              LottieBuilder.asset("assets/animation/Animation.json",
              fit: BoxFit.cover,
              repeat: true,
              height: 300,
              width: 300,)
          ],
        ),
      ),
    );
  }
}
