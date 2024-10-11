ScanCard
ScanCard is an iOS application built in Swift for detecting cards using the camera preview. It employs two techniques: Rectangle Detection with CIRectangleDetector and Document Detection with Vision Kit.

Features
Real-time card detection using camera preview.
Two detection methods:
Rectangle Detection: Uses CIRectangleDetector for identifying rectangular shapes.
Document Detection: Utilizes Vision Kit for enhanced document detection.
Requirements
iOS 13.0 or later
Xcode 11 or later
Swift 5.0 or later
Usage
Launch the app on a physical device.
Allow camera permissions.
Aim the camera at a card; detected cards will be highlighted in real-time.
Techniques Used
Rectangle Detection: Processes frames with CIRectangleDetector to find and outline rectangles.
Document Detection: Leverages Vision Kit's VNDocumentCameraViewController for robust detection of various document types.
Contributing
Contributions are welcome! Fork the repository, make your changes, and submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
Apple Developer Documentation for Core Image and Vision Kit.
Open-source community for inspiration.
