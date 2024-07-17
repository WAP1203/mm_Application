import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_motionmartial/api/service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'editeprofile.dart'; // Assuming this is correctly imported
import 'signin.dart'; // Assuming this is correctly imported

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserProfile> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = fetchProfile();
  }

  Future<UserProfile> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('accessToken');

    final url = Uri.parse(AppServices.getProtectedEndpoint());
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    final jsonResponse = jsonDecode(response.body);
    return UserProfile.fromJson(jsonResponse);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('accessToken');

    final url = Uri.parse(AppServices.getLogoutEndpoint());
    await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    await prefs.remove('accessToken'); // Hapus token dari shared preferences
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: Signin(), // Ganti dengan halaman login yang benar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'PROFILE',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.red.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FutureBuilder<UserProfile>(
            future: _profileData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text('No data found'),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      _buildProfilePicture(snapshot.data!.photo),
                      SizedBox(height: 16),
                      _buildProfileActions(context, snapshot.data!),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture(String photoUrl) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(photoUrl),
      ),
    );
  }

  Widget _buildProfileActions(BuildContext context, UserProfile userProfile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Name: ${userProfile.name}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ${userProfile.email}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          _buildEditProfileButton(),
          SizedBox(height: 16),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return ElevatedButton(
      onPressed: _editProfile,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Edit Profile',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfile()),
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: logout,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Logout',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String photo;

  UserProfile({
    required this.name,
    required this.email,
    required this.photo,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['username'] ?? 'N/A',
      email: json['email'] ?? 'N/A',
      photo: json['profile_picture'] ?? '/static/uploads/default.jpg',
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storage.read(key: 'auth_token'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data != null) {
          return MaterialApp(
            home: ProfileScreen(),
          );
        } else {
          return MaterialApp(
            home: Signin(),
          );
        }
      },
    );
  }
}
