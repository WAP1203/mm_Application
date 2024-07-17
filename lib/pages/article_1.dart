import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Article1 extends StatelessWidget {
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
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(21, 12, 21, 0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    buildTopRow(),
                    buildLogoSection(),
                  ],
                ),
              ),
            ),
          ),
          buildContentSection(),
        ],
      ),
    );
  }

  Widget buildTopRow() {
    return Positioned(
      top: 0,
      child: SizedBox(
        width: 318,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSignalRow(),
            buildIconsRow(),
          ],
        ),
      ),
    );
  }

  Widget buildSignalRow() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 2.6, 6, 2.4),
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/signal.png'),
            ),
          ),
        ),
        Text(
          '6:26',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 13.3,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }

  Widget buildIconsRow() {
    return Row(
      children: [
        buildSvgIcon('assets/vectors/vector_21_x2.svg', 7.1, 11.6,
            EdgeInsets.fromLTRB(0, 2.1, 5.4, 2.4)),
        buildSvgIcon('assets/vectors/component_11_x2.svg', 8.7, 10.6,
            EdgeInsets.fromLTRB(0, 2.9, 5.8, 2.5)),
        buildSvgIcon('assets/vectors/wifi_3_x2.svg', 16.1, 16.1,
            EdgeInsets.fromLTRB(0, 0, 5.9, 0)),
        buildSvgIcon('assets/vectors/vector_57_x2.svg', 22, 9.5,
            EdgeInsets.fromLTRB(0, 3.1, 0, 3.5)),
      ],
    );
  }

  Widget buildSvgIcon(
      String assetName, double width, double height, EdgeInsets margin) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: SvgPicture.asset(assetName),
    );
  }

  Widget buildLogoSection() {
    return Positioned(
      top: 0,
      left: 53.8,
      right: 53.8,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 22.2),
            width: 210.3,
            height: 210.3,
            child: SvgPicture.asset('assets/vectors/container_3_x2.svg'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 24.8, 0),
            child: Text(
              'OUTZY',
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            left: 6.2,
            top: 8.5,
            child: SvgPicture.asset(
              'assets/vectors/group_362_x2.svg',
              width: 191,
              height: 191,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContentSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 48.5, 25, 106),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          buildImageSection(),
          buildTitle(),
          buildSubtitle(),
          buildDescription(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 43.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/vectors/vector_37_x2.svg',
            width: 14.7,
            height: 25,
          ),
          Text(
            'Article',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              height: 0.9,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 0, 14),
      width: 309,
      height: 176,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF000000)),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/article.jpeg'),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: Text(
        'Latihan Seni Bela Diri Karate',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Color(0xFF1B1B1B),
        ),
      ),
    );
  }

  Widget buildSubtitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 1, 5, 1),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(9, 9, 9, 8),
              child: SvgPicture.asset(
                'assets/vectors/vector_1_x2.svg',
                width: 16,
                height: 17,
              ),
            ),
          ),
          Text(
            'Kompas.com 21/07/2022, 02:00 WIB',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(0xFF7E7E7E),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescription() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        text: 'Kuda-kuda (Dachi) ',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xFF656565),
        ),
        children: [
          TextSpan(
            text:
                'Kuda-kuda atau dachi dalam karate terdiri dari tiga bagian yaitu: Kiba Dachi: Kuda-kuda posisi sudut berat badan di tengah. Zenkutsu Dachi: Kuda-kuda posisi sudut berat badan ke depan. Khokutsu Dachi: Kuda-kuda posisi sudut berat badan ke belakang.',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 1.3,
            ),
          ),
          TextSpan(
            text: ' Tangkisan (Uke)',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.3,
            ),
          ),
          TextSpan(
            text:
                ' Gedan Barai: Tangkisan dengan tangan sebagai sapuan bawah. Age Uke: Tangkisan dengan tangan melindungi kepala. Ude Uke: Tangkisan tangan melindungi badan bagian depan. Uchi Uke: Tangkisan tangan melindungi badan bagian depan. Shuto Uke: Tangkisan tangan pedang.',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
