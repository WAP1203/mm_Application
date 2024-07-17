import 'package:flutter/material.dart';
import 'dart:ui';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:flutter_motionmartial/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Container(
        padding: EdgeInsets.fromLTRB(21, 12, 21, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 33.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 1.1, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 2.6, 6, 2.4),
                                width: 11,
                                height: 11,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        'assets/images/signal.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 11,
                                    height: 11,
                                  ),
                                ),
                              ),
                              Text(
                                '6:26',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                          child: SizedBox(
                            width: 71,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 2.1, 5.4, 2.4),
                                  child: SizedBox(
                                    width: 7.1,
                                    height: 11.6,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_22_x2.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 2.9, 5.8, 2.5),
                                  child: SizedBox(
                                    width: 8.7,
                                    height: 10.6,
                                    child: SvgPicture.asset(
                                      'assets/vectors/component_111_x2.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5.9, 0),
                                  child: SizedBox(
                                    width: 16.1,
                                    height: 16.1,
                                    child: SvgPicture.asset(
                                      'assets/vectors/wifi_8_x2.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 3.1, 0, 3.5),
                                  width: 22,
                                  height: 9.5,
                                  child: SizedBox(
                                    width: 22,
                                    height: 9.5,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_15_x2.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 112.8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3.2, 4.4, 5.2),
                            child: Text(
                              'skip',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 0.4,
                                color: Color(0xFF212121),
                              ),
                            ),
                          ),
                          Container(
                            width: 7.2,
                            height: 14.4,
                            child: SizedBox(
                              width: 7.2,
                              height: 14.4,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_7_x2.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(17.4, 0, 16.2, 35.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(142.2),
                      ),
                      child: Container(
                        width: 284.5,
                        height: 284.5,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 0, 0, 108),
                    child: Text(
                      'Ketahuilah Beragam Teknik ',
                      style: GoogleFonts.getFont(
                        'Antonio',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 4, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF6A7EFC),
                            ),
                            child: Container(
                              width: 32,
                              height: 6,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFADADAD),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Container(
                              width: 6,
                              height: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 131,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF0EDE6),
                  borderRadius: BorderRadius.circular(141.5),
                ),
                child: Container(
                  width: 283,
                  height: 283,
                ),
              ),
            ),
            Positioned(
              left: -51,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6A7EFC),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Positioned(
              right: -83,
              bottom: 170,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFF5656),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Container(
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            Positioned(
              top: 186,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/boy.png',
                    ),
                  ),
                ),
                child: Container(
                  width: 252,
                  height: 302,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
