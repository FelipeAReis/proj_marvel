import 'package:flutter/material.dart';
import 'package:proj_marvel/View/home.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel App',
      theme: ThemeData(
        primarySwatch: Colors.green,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Splash Screen',),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return _introScreen(size);
  }
}

Widget _introScreen(Size size) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff81C784),
            Color(0xff2E7D32),
          ],
        ),
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.transparent,
      ),
      Container(
        width: size.width * 0.70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo_white.png"),
            fit: BoxFit.contain,
          ),
          
        ),

      ),
    ],
  );
}
