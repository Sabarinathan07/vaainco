import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constant.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Camera permission is required to scan QR codes.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code);
      String? code = scanData.code;
      controller.pauseCamera();
      showDialog(
        context: context,
        builder: (context) {
          return Stack(
            alignment: Alignment.bottomCenter, // align to the bottom center of the screen
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),                child: Container(
                  width: double.infinity,  // make the container take up the entire width of the screen
                  height: 130,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Scan Result'),
                      Text(code!),
                      ElevatedButton(
                        onPressed: () {
                          controller.resumeCamera();
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(vPrimaryColor),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'ADD',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            ],
          );
        },
      ).then((value) => controller.resumeCamera());


    });
  }
}
