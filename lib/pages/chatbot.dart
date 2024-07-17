import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Chatbot extends StatefulWidget {
  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    _buildAppBar(),
                    SizedBox(height: 10),
                    Expanded(child: _buildChatArea()),
                    _buildMessageInputArea(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        children: [
          Spacer(),
          Text(
            'MMBot',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xFF000000),
            ),
          ),
          Spacer(),
          Row(
            children: [
              SvgPicture.asset(
                  'assets/vectors/bold_duotone_essentional_ui_danger_triangle_x2.svg',
                  width: 40,
                  height: 40),
              SizedBox(width: 10),
              SvgPicture.asset(
                  'assets/vectors/bold_duotone_essentional_ui_trash_bin_2_x2.svg',
                  width: 40,
                  height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildChatMessage(
            message: 'MMBot',
            time: '12:00 PM',
            backgroundColor: Color(0xFFF0EDE6),
            textColor: Color(0xFF000000),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildChatMessage({
    required String message,
    required String time,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: textColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            time,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: textColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFBDBDBD)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a new message',
                hintStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF424242),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/vectors/vector_27_x2.svg',
                width: 20, height: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/vectors/vector_42_x2.svg',
                width: 20, height: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/vectors/vector_51_x2.svg',
                width: 20, height: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
