import 'package:ecom_fe/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if(status){
            _navigateToLogin();
          }
//          else {
//            //_navigateToLogin();
//          }
        }
    );
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});

    return true;
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/splash-screen.png')
          ),
      ),
    );
  }
}
