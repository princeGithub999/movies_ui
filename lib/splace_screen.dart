import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:movies_ui/buttomNavigation.dart';

// class SplaceScreen extends StatefulWidget {
//   const SplaceScreen({super.key});
//
//   @override
//   _SplaceScreenState createState() => _SplaceScreenState();
// }
//
// class _SplaceScreenState extends State<SplaceScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               'Suppose this is an app in your Phone\'s Screen page.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             OpenContainer(
//               closedBuilder: (_, openContainer) {
//                 return Container(
//                   height: 80,
//                   width: 80,
//                   child: Center(
//                     child: Text(
//                       'App Logo',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               openColor: Colors.white,
//               closedElevation: 20,
//               closedShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               transitionDuration: Duration(milliseconds: 700),
//               openBuilder: (_, closeContainer) {
//                 return SecondPage();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  _SplaceScreenState createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ScaleTransition1(
            BottomNavigationPage(),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.2),
              Colors.red.withOpacity(0.3),
              Colors.blue.withOpacity(0.5)
            ],
                begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode:TileMode.clamp
          )
        ),
        child: Center(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: _d ? 1000 : 2500),
                curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
                height: _d
                    ? 0
                    : _a
                    ? _h / 2
                    : 20,
                width: 50,
                // color: Colors.deepPurpleAccent,
              ),
              AnimatedContainer(
                duration: Duration(
                    seconds: _d
                        ? 1
                        : _c
                        ? 2
                        : 0),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _d
                    ? _h
                    : _c
                    ? 100
                    : 20,
                width: _d
                    ? _w
                    : _c
                    ? 100
                    : 20,

                decoration: BoxDecoration(
                    color: _b ? Colors.white54: Colors.transparent.withOpacity(0.1),
                    // shape: _c? BoxShape.rectangle : BoxShape.circle,
                    borderRadius:
                    _d ? BorderRadius.only() : BorderRadius.circular(100)),
                child: Center(
                  child: _e
                      ? AnimatedSwitcher(
                    duration: Duration(seconds: 20),
                    child: Lottie.asset('assets/images/fourdoth.json',width: 150,height: 150,),

                  )
                      : SizedBox(),
                ),
              ),
              Spacer(),
              Padding(padding: EdgeInsets.only(bottom: 10),
               child: Column(
                 children: [
                   AnimatedTextKit(
                     animatedTexts: [
                       WavyAnimatedText('Wellcome to my application',
                     textStyle: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.white54,),
                      speed: Duration(milliseconds: 100),
                       )
                     ],
                    isRepeatingAnimation: true,
                   ),
                   AnimatedTextKit(
                     animatedTexts: [
                       WavyAnimatedText("let's go play video",
                     textStyle: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.white54,),
                      speed: Duration(milliseconds: 100),
                       )
                     ],
                    isRepeatingAnimation: true,
                   ),
                 ],
               ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 500), // Increased
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.linear); // Simplified reverse curve
      return ScaleTransition(
        alignment: Alignment.bottomCenter,
        scale: animation,
        child: child,
      );
    },
  );
}



