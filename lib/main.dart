import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'joystick_page.dart';

import 'nlp_detector_views/entity_extraction_view.dart';
import 'nlp_detector_views/language_identifier_view.dart';
import 'nlp_detector_views/language_translator_view.dart';
import 'nlp_detector_views/smart_reply_view.dart';
import 'vision_detector_views/barcode_scanner_view.dart';
import 'vision_detector_views/digital_ink_recognizer_view.dart';
import 'vision_detector_views/document_scanner_view.dart';
import 'vision_detector_views/face_detector_view.dart';
import 'vision_detector_views/face_mesh_detector_view.dart';
import 'vision_detector_views/label_detector_view.dart';
import 'vision_detector_views/object_detector_view.dart';
import 'vision_detector_views/pose_detector_view.dart';
import 'vision_detector_views/selfie_segmenter_view.dart';
import 'vision_detector_views/text_detector_view.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize cameras

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ESP32Communication(),
    );
  }
}

class ESP32Communication extends StatefulWidget {
  @override
  _ESP32CommunicationState createState() => _ESP32CommunicationState();
}

class _ESP32CommunicationState extends State<ESP32Communication> {
  final String esp32Ip = "192.168.4.1";
  bool isScanning = false;
  FlutterBluePlus flutterBlue = FlutterBluePlus();
  int _pageIndex = 0;

  Future<void> sendMessage(String message) async {
    try {
      final response =
          await http.get(Uri.parse('http://$esp32Ip/?message=$message'));
      if (response.statusCode == 200) {
        print("Message sent successfully");
      } else {
        print("Failed to send message");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void scanForDevices() {
    setState(() {
      isScanning = true;
    });
    FlutterBluePlus.startScan(timeout: Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        print("Found device: \${result.device.name} (\${result.device.id})");
      }
    }).onDone(() {
      setState(() {
        isScanning = false;
      });
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    SettingsScreen(),
    ModesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            scanForDevices();
            sendMessage("Scanning for devices");
          },
        ),
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.grey[900]!,
        buttonBackgroundColor: Colors.white,
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
          Icon(Icons.dashboard, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[900]!.withOpacity(0.1),
            Colors.blueGrey.shade900
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/phonetripod.png",
                height: MediaQuery.of(context).size.width * 0.4,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                "TRIPOD",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Model V1",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
              SizedBox(height: 30),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: _buildInfoCard(
                          "Battery", "73%", "6 Hours Left", " ")),
                  SizedBox(width: 10)
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      String title, String value, String subValue, String subText) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[900]!.withOpacity(0.1), // Increased transparency
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 10),
          Text(value,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          if (subValue.isNotEmpty)
            Text(subValue, style: TextStyle(color: Colors.grey)),
          if (subText.isNotEmpty)
            Text(subText, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.blueGrey.shade900],
        ),
      ),
      child: Center(
        child: Text("Settings Page",
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

class ModesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[900]!.withOpacity(0.1),
            Colors.blueGrey.shade900
          ],
        ),
      ),
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/phonetripod.png',
                    width: 300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100]!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: Colors.blue[900]!.withOpacity(0.1),
                        title: Text('Tracking Mode',
                            style: TextStyle(color: Colors.white)),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ObjectDetectorView()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Path Planning Mode',
                            style: TextStyle(color: Colors.white)),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Manual Mode',
                            style: TextStyle(color: Colors.white)),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JoystickControlPage()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Arc Mode',
                            style: TextStyle(color: Colors.white)),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
