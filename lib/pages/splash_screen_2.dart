import 'package:flutter/material.dart';
import 'package:flutter_motionmartial/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFF2F2F2),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF393939),
              offset: Offset(0, 0),
              blurRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 21),
        child: Stack(
          children: [
            _buildBackgroundCircles(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCircles() {
    return Stack(
      children: [
        Positioned(
          top: 250,
          left: 60,
          child: Container(
            width: 283,
            height: 283,
            decoration: BoxDecoration(
              color: Color(0xFFF0EDE6),
              borderRadius: BorderRadius.circular(141.5),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 400,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFF6A7EFC),
              borderRadius: BorderRadius.circular(75),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 400,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFF24D4D),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(),
          SizedBox(height: 20),
          _buildTitleAndDescription(),
          SizedBox(height: 40),
          _buildGetStartedButton(context),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/girl.png'),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sempurnakan Teknik Anda',
            style: GoogleFonts.antonio(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Tingkatkan pelatihan dan kuasailah semua gerakan',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xFF3E3D3D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Signup()),
        );
      },
      child: Container(
        width: 188,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xFF000000),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Get Started',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
