import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter_motionmartial/main.dart';
import 'package:http/http.dart' as http;

class DeteksiScreen extends StatefulWidget {
  @override
  _DeteksiScreenState createState() => _DeteksiScreenState();
}

class _DeteksiScreenState extends State<DeteksiScreen> {
  CameraController? controller;
  Timer? _timer;
  Uint8List? _imageBytes;
  bool _processingFrame = false;

  String? _selectedGender;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _daerahController = TextEditingController();
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _currentDate = DateTime.now().toIso8601String();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller?.dispose();
    _emailController.dispose();
    _daerahController.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    if (cameras != null && cameras!.isNotEmpty) {
      controller = CameraController(cameras![1], ResolutionPreset.medium);
      try {
        await controller!.initialize();
      } catch (e) {
        print('Error initializing camera: $e');
      }
      if (!mounted) return;
      setState(() {});
    } else {
      print('No cameras found');
    }
  }

  Future<void> processFrame() async {
    if (controller == null || !controller!.value.isInitialized) {
      print('Camera is not initialized');
      return;
    }

    _processingFrame = true;

    try {
      XFile picture = await controller!.takePicture();
      Uint8List bytes = await picture.readAsBytes();
      String base64Image = base64Encode(bytes);

      print('Base64 image length: ${base64Image.length}');

      final response = await http.post(
        Uri.parse('http://192.168.43.213:5000/video_feed'),
        body: {
          'frame': base64Image,
          'email': _emailController.text,
          'gender': _selectedGender ?? '',
          'daerah': _daerahController.text,
          'tanggal': _currentDate,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _imageBytes = base64Decode(jsonDecode(response.body)['frame']);
        });
      } else {
        print('Failed to process frame: ${response.statusCode}');
      }
    } catch (e) {
      print('Error processing frame: $e');
    } finally {
      _processingFrame = false;
    }
  }

  void startDetection() {
    if (_selectedGender == null ||
        _emailController.text.isEmpty ||
        _daerahController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select gender, enter email and daerah')),
      );
      return;
    }

    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (!_processingFrame) {
        processFrame();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motion Martial Detection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _imageBytes != null
                ? Image.memory(
                    _imageBytes!,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Male', 'Female']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  hint: Text('Select Gender'),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                TextField(
                  controller: _daerahController,
                  decoration: InputDecoration(
                    labelText: 'Daerah',
                  ),
                ),
                Text('Tanggal: $_currentDate'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              startDetection();
            },
            child: Text('Process Frame'),
          ),
        ],
      ),
    );
  }
}
