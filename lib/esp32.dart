import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'joystick_page.dart';

class ESP32Communication extends StatefulWidget {
  @override
  _ESP32CommunicationState createState() => _ESP32CommunicationState();

  Future<void> sendMessage(String message) async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.4.1/?message=$message'));
      if (response.statusCode == 200) {
        print("Message sent successfully: $message");
      } else {
        print("Failed to send message");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
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

  final List<Widget> _pages = [];

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
