import 'package:flutter/material.dart';
import 'package:i_am_rich/modules/shop_app/update/update_screen.dart';

class SliderRight extends PageRouteBuilder {
  final page;
  final rotate;

  SliderRight({this.page, this.rotate})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (
              context,
              animation,
              animationTwo,
              child,
            ) {
              if (rotate == 1) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              } else if (rotate == 2) {
                var begin = 0.0;
                var end = 1.0;
                var tween = Tween(begin: begin, end: end);
                var curvesAnimation =
                    CurvedAnimation(parent: animation, curve: Curves.linear);
                return RotationTransition(
                  turns: tween.animate(curvesAnimation),
                  child: child,
                );
              } else if (rotate == 3) {
                return Align(
                  alignment: Alignment.center,
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: child,
                  ),
                );
              } else if (rotate == 4) {
                var begin = 1.0;
                var end = 0.0;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return ScaleTransition(
                  scale: tween.animate(offsetAnimation),
                  child: RotationTransition(
                      turns: tween.animate(offsetAnimation), child: child),
                );
              } else if (rotate == 5) {
                return TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 0.0),
                  duration: const Duration(milliseconds: 1500),
                  child: const UpdateScreen(),
                  builder: (context, double value, child) {
                    return ShaderMask(
                      shaderCallback: (rect) {
                        return RadialGradient(
                          radius: value * 5.0,
                          colors: const [Colors.white , Colors.white , Colors.transparent , Colors.transparent],
                          stops:const  [0.0 , 0.55 , 0.6 ,1.0],
                          center: const FractionalOffset(0.95 , 0.90),
                        ).createShader(rect);
                      },
                      child: child,
                    );
                  },
                );
              } else {
                var begin = 1.0;
                var end = 0.0;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return ScaleTransition(
                  scale: tween.animate(offsetAnimation),
                  child: child,
                );
              }
            });
}
