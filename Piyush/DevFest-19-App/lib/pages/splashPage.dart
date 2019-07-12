import 'package:flutter/material.dart';
//
import './home.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  Animation _logoAnimation;
  AnimationController _logoController;

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    );

    _logoAnimation.addListener(() {
      if (_logoAnimation.status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()));
        return;
      }
      this.setState(() {});
    });

    _logoController.forward();
    super.initState();
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        height: _logoAnimation.value * 200,
        width: _logoAnimation.value * 200,
        child: Image.asset(
          'assets/logodevFest.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLogo(),
    );
  }
} 
