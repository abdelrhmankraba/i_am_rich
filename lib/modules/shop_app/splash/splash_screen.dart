import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:i_am_rich/layout/shop_app/shop_layout.dart';
import 'package:i_am_rich/modules/shop_app/login/shop_login_screen.dart';
import 'package:i_am_rich/shared/components/constants.dart';
import 'package:i_am_rich/shared/styless/colors.dart';
import '../../../shared/components/components.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(seconds: 4) , _getNext);
  }
  _getNext(){
    if(token != null){
      navigateAndFinish(context, const ShopLayout());
    }else{
      navigateAndFinish(context, const ShopLoginScreen());
    }
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 300.0,
              width: double.infinity,
              child:Image(
                image: AssetImage(
                  'assets/images/onBoard1.jpg',
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
            DefaultTextStyle(
              style: const TextStyle(
                  color: colorBottom,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Shop App'),
                ],
                onTap: (){},
                repeatForever: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
