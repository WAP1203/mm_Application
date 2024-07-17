import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_motionmartial/pages/article.dart';
import 'package:google_fonts/google_fonts.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF393939),
            offset: Offset(0, 0),
            blurRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menambahkan Padding untuk memberikan ruang kosong di atas tulisan "Welcome!"
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40, // Kamu bisa menyesuaikan jarak sesuai kebutuhan
                        right: 20, // Jarak dari kanan untuk icon settings
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Welcome!',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF3E3D3D),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width - 50, 80, 10, 0),
                              items: [
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/changeemail'); // Navigate to change email page
                                    },
                                    child: Text("Change Email"),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/changepassword'); // Navigate to change password page
                                    },
                                    child: Text("Change Password"),
                                  ),
                                ),
                              ],
                              elevation: 8.0,
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/vectors/settings.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0x7D5882C1)),
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0x1AFFFFFF),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Motion Material merupakan Sistem deteksi gerakan olahraga beladiri, Sistem ini dapat membedakan antara berbagai gerakan beladiri Karate.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            child: SvgPicture.asset(
                              'assets/vectors/figpie_x2.svg',
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFA3838),
                                  ),
                                  width: 17,
                                  height: 17,
                                  margin: EdgeInsets.symmetric(vertical: 7),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2E4BE2),
                                  ),
                                  width: 17,
                                  height: 17,
                                  margin: EdgeInsets.symmetric(vertical: 7),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF35F03D),
                                  ),
                                  width: 17,
                                  height: 17,
                                  margin: EdgeInsets.symmetric(vertical: 7),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEBFF00),
                                  ),
                                  width: 17,
                                  height: 17,
                                  margin: EdgeInsets.symmetric(vertical: 7),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF12F6),
                                  ),
                                  width: 17,
                                  height: 17,
                                  margin: EdgeInsets.symmetric(vertical: 7),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kuda_Kuda (Dachi)',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Tangkisan (Uke)',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Pukulan (Tsuki)',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Tendangan (Geri)',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Semua Gerakan',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Article',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Color(0xFF212121),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Article()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xFF6A7EFC),
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFFF5656),
                              width: 2,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(
                            20, 20, 20, 20), // Adjust padding as needed
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align items to the start vertically
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Teknik Dasar Gerakan Karate',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: Color(0xFFF0EDE6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adjust spacing between text and image
                            Image.asset(
                              'assets/images/girl.png', // Replace with your image path
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover, // Adjust image fit as needed
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Teknik Gerakan Dasar Karate',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xFF212121),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'See all',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xCF6E6E6E),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios,
                                size: 12, color: Color(0xCF6E6E6E)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Article()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xFFFF5656),
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF6A7EFC),
                              width: 2,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(
                            20, 20, 20, 20), // Adjust padding as needed
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align items to the start vertically
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Latihan Seni Beladiri Karate',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: Color(0xFFF0EDE6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adjust spacing between text and image
                            Image.asset(
                              'assets/images/boy.png', // Replace with your image path
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover, // Adjust image fit as needed
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Latihan Seni Beladiri Karate',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xFF212121),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'See all',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xCF6E6E6E),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios,
                                size: 12, color: Color(0xCF6E6E6E)),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/beranda');
                            },
                            child: SvgPicture.asset(
                              'assets/vectors/home_22_x2.svg',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/deteksi');
                            },
                            child: SvgPicture.asset(
                              'assets/vectors/group_3_x2.svg',
                              width: 27,
                              height: 27,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/chatbot');
                            },
                            child: SvgPicture.asset(
                              'assets/vectors/group_4_x2.svg',
                              width: 27,
                              height: 27,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            child: SvgPicture.asset(
                              'assets/vectors/group_12651_x2.svg',
                              width: 27,
                              height: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
