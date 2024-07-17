import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motionmartial/pages/article.dart';
import 'package:flutter_motionmartial/pages/beranda.dart';
import 'package:flutter_motionmartial/pages/changeemail.dart';
import 'package:flutter_motionmartial/pages/changepassword.dart';
import 'package:flutter_motionmartial/pages/chatbot.dart';
import 'package:flutter_motionmartial/pages/deteksi_screen.dart';
import 'package:flutter_motionmartial/pages/forgotpassword.dart';
import 'package:flutter_motionmartial/pages/profile_screen.dart';
import 'package:flutter_motionmartial/pages/signin.dart';
import 'package:flutter_motionmartial/pages/splash_screen_2.dart';
import 'package:flutter_motionmartial/pages/signup.dart';
// import 'package:flutter_motionmartial/pages/verifikasi.dart';
import 'package:flutter_motionmartial/pages/editeprofile.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motion Martial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen2(),
        '/signin': (context) => Signin(),
        '/signup': (context) => Signup(),
        '/beranda': (context) => Beranda(),
        '/chatbot': (context) => Chatbot(),
        '/deteksi': (context) => DeteksiScreen(),
        '/profile': (context) => ProfileScreen(),
        '/verifikasi': (context) => Verifikasi(),
        '/article': (context) => Article(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/changepassword': (context) => ChangePassword(),
        '/changeemail': (context) => ChangeEmail(),
        '/editeprofile': (context) => EditProfile(),
      },
    );
  }
}
