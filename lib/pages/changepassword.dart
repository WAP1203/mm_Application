import 'package:flutter/material.dart';
import 'package:flutter_motionmartial/api/service.dart';
import 'package:flutter_motionmartial/pages/beranda.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  // final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> changePassword(BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse(AppServices.getUpdatepassEndpoint()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer YOUR_TOKEN', 
      },
      body: jsonEncode(<String, String>{
        'Password lama': _currentPasswordController.text,
        'Password baru': _newPasswordController.text,
      }),
    );

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text('Password changed successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      String errorMessage = 'Failed to change password. Please try again.';
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        try {
          final Map<String, dynamic> responseData = json.decode(response.body);
          errorMessage = responseData['message'] ?? errorMessage;
        } catch (e) {
          print('Error parsing JSON response: $e');
        }
      }
      
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  } catch (e) {
    print('Error sending request: $e');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Failed to communicate with server. Please check your connection.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildLogo(),
                _buildChangePasswordForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Image.asset(
        'assets/images/logo.png',
        width: 250,
        height: 250,
      ),
    );
  }

  Widget _buildChangePasswordForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
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
            'Set a new password',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Create a new password. Ensure it differs from previous ones for security.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24),
          _buildTextField('Old Password', 'Enter your old password',
              isPassword: true, controller: _currentPasswordController),
          SizedBox(height: 16),
          _buildTextField('New Password', 'Enter your new password',
              isPassword: true, controller: _newPasswordController),
          // SizedBox(height: 16),
          // _buildTextField('Confirm New Password', 'Re-enter password', isPassword: true, controller: _confirmPasswordController),
          SizedBox(height: 24),
          _buildChangePasswordButton(context),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder,
      {bool isPassword = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            suffixIcon: isPassword
                ? Icon(Icons.visibility_off, color: Colors.grey.shade600)
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildChangePasswordButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        changePassword(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Update Password',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
