import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Article',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Color(0xFF212121),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF212121)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                'assets/images/article.jpeg', // Path to your image
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Latihan Seni Bela Diri Karate',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Color(0xFF212121),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.language, color: Colors.grey, size: 16),
                SizedBox(width: 5),
                Text(
                  'Kompas.com',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '21/07/2022, 02:00 WIB',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '''
- Kuda-kuda (Dachi)
Kuda-kuda atau dachi dalam karate terdiri dari tiga bagian yaitu: Kiba Dachi: Kuda-kuda posisi sudut berat badan di tengah Zenkutsu Dachi: Kuda-kuda posisi sudut berat badan ke depan. Khokutsu Dachi: Kuda-kuda posisi sudut berat badan ke belakang.

- Tangkisan (Uke)
1. Gedan Barai: Tangkisan dengan tangan sebagai sapuan bawah.
2. Age Uke: Tangkisan dengan tangan melindungi kepala.
3. Ude Uke: Tangkisan tangan melindungi badan bagian depan.
4. Uchi Uke: Tangkisan tangan melindungi badan bagian depan.
5. Shuto Uke: Tangkisan tangan pedang.
              ''',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Color(0xFF212121),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
