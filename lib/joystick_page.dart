import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:tracer_app_mvp/esp32.dart';

class JoystickControlPage extends StatefulWidget {
  @override
  _JoystickControlPageState createState() => _JoystickControlPageState();
}

class _JoystickControlPageState extends State<JoystickControlPage> {
  double topX = 0, topY = 0;
  double leftMotor = 0, rightMotor = 0;
  ESP32Communication esp32Communication = ESP32Communication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Centered Joystick
          Align(
            alignment: Alignment.topCenter,
            child: Joystick(
              listener: (details) {
                setState(() {
                  topX = details.x;
                  topY = details.y;
                  esp32Communication.sendMessage("speed1=$topX&speed2=$topY");
                });
              },
              mode: JoystickMode.all,
            ),
          ),

          SizedBox(height: 40),

          // Right Motor Slider
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Right Motor',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Slider(
                value: rightMotor,
                min: -1,
                max: 1,
                divisions: 20,
                label: rightMotor.toStringAsFixed(2),
                onChanged: (value) {
                  setState(() {
                    rightMotor = value;
                  });
                  //esp32Communication.sendMessage("rightMotor=$rightMotor");
                },
              ),
            ],
          ),

          // Left Motor Slider
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Left Motor',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Slider(
                value: leftMotor,
                min: -1,
                max: 1,
                divisions: 20,
                label: leftMotor.toStringAsFixed(2),
                onChanged: (value) {
                  setState(() {
                    leftMotor = value;
                  });
                  //esp32Communication.sendMessage("leftMotor=$leftMotor");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
