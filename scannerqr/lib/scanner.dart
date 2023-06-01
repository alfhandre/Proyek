import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scannerqr/home.dart';

class Scanner extends StatefulWidget {
  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _flashOn = false;
  bool _frontCam = false;
  GlobalKey _qrkey = GlobalKey();
  Home homes = new Home();

  late QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: _qrkey,
            onQRViewCreated: (QRViewController controller) {
              this._controller = controller;
              controller.scannedDataStream.listen((qrData) {
                // setState(() {
                if (mounted) {
                  _controller.dispose();
                  print("KONTOLLLLLLLLLL");
                  print(qrData.code);
                  print("KONTOLLLLLLLLLL");
                  Navigator.pop(context, qrData.code);
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return Home();
                  //   },
                  // ));
                }
                // });
              });
            },
            overlay: QrScannerOverlayShape(borderColor: Colors.white),
          ),
          // Container(
          //   color: Colors.blue,
          // ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                'Scanner',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _flashOn = !_flashOn;
                    });
                    _controller.toggleFlash();
                  },
                ),
                IconButton(
                  icon:
                      Icon(_frontCam ? Icons.camera_front : Icons.camera_rear),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _frontCam = !_frontCam;
                    });
                    _controller.flipCamera();
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => Home(),
                        ));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
