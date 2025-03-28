### Tracer App MVP
 Tracer App MVP is a Flutter-based control interface for remotely operating robotic systems, integrating joystick-based motion control, real-time ESP32 communication, and motor speed adjustments via sliders.




## Features
- Dual Joystick Control – Allows users to control robot movement using an intuitive on-screen joystick.
- Motor Speed Sliders – Adjusts left and right motor speeds dynamically.
- ESP32 Communication – Sends movement commands via Wi-Fi to an ESP32-based robotic system.
- Real-Time Feedback – Displays joystick and slider values for precise control.
- Modern UI/UX – A minimalist, dark-themed interface for ease of use.

## Screenshots
# Home Page
![Screenshot_20250328-122441_tracer_app_mvp](https://github.com/user-attachments/assets/a1484096-7af8-4f20-b692-7b8e27dee003)
# Tripod Mode Page
![Screenshot_20250328-122445_tracer_app_mvp](https://github.com/user-attachments/assets/838cff56-fdcc-4390-b044-2398c091077b)
# Manual Control Page
![Screenshot_20250328-122450_tracer_app_mvp](https://github.com/user-attachments/assets/f673490c-8222-4231-b500-bcc81c18addb)
# TRACKING Mode Page
![Screenshot_20250328-122626_tracer_app_mvp](https://github.com/user-attachments/assets/6059ba8b-2941-4d5d-a7e6-43342ade0c46)






## Technologies Used
|Technology|	Purpose|
|Flutter|	UI framework for cross-platform development|
|Dart|	Programming language used in Flutter|
|flutter_joystick|	Joystick package for motion control|
|ESP32|	Microcontroller for hardware communication|
|HTTPS/Wi-Fi|	Wireless communication protocol|
📦 Installation & Setup
🔹 Prerequisites
Install Flutter SDK (Download Here)

Install Dart (Download Here)

Install Git (Download Here)

🔹 Clone the Repository
sh
Copy
Edit
git clone https://github.com/SolomonNwachukwu/tracer_app_mvp.git
cd tracer_app_mvp
🔹 Install Dependencies
sh
Copy
Edit
flutter pub get
🔹 Run the App
sh
Copy
Edit
flutter run
(Ensure your device/emulator is connected and running.)

⚙️ How It Works
1️⃣ Open the app and connect it to the ESP32-based robotic system.
2️⃣ Use the joystick for directional control of the robot.
3️⃣ Adjust the left and right motor speeds using the provided sliders.
4️⃣ The app sends commands over Wi-Fi (via MQTT or HTTP requests).
5️⃣ The robot receives and executes movement commands accordingly.

📌 To-Do / Future Improvements
🔹 Add Bluetooth Support for offline communication.
🔹 Implement Gesture Controls for smoother interaction.
🔹 Enhance Real-Time Feedback with sensor data visualization.
🔹 Optimize UI/UX for a more immersive user experience.

