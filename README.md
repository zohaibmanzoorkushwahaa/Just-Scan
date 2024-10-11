ScanCard
ScanCard is an iOS application built in Swift that detects cards using the device's camera preview. This project utilizes two techniques for card detection: Rectangle Detection with CIRectangleDetector and Document Detection with Vision Kit.

Features
Real-time card detection using camera preview.
Two detection methods:
Rectangle Detection: Identifies rectangular shapes using CIRectangleDetector.
Document Detection: Utilizes Vision Kit for advanced document detection.
Requirements
iOS 13.0 or later
Xcode 11 or later
Swift 5.0 or later
Usage
Launch the app on your device.
Grant camera permissions when prompted.
Point the camera at a card you want to detect.
The app will highlight detected cards in real-time.
Techniques Used
Rectangle Detection
Utilizes CIRectangleDetector from Core Image.
Processes camera frames to identify and outline rectangular shapes.
Document Detection
Uses Vision Kit's VNDocumentCameraViewController.
More robust detection that can handle various document formats and orientations.
Contributing
Contributions are welcome! If you have suggestions or improvements, feel free to fork the repository and submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
Apple Developer Documentation for Core Image and Vision Kit.
Open-source community for inspiration and resources.
Contact
For any inquiries or feedback, please contact ZohaibManzoorkushwaha@gmail.com.
