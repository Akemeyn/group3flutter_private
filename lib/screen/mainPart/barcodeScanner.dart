import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nutrijourney/components/componentEditor.dart';


class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String _scanBarcodeResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Barcode Screen", style: ComponentEditor.specialText(24, Colors.black)),
        centerTitle: true,
      ),
      body: Builder(
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: scanBarcodeNormal,
                  child: Text("Start barcode scan")),
              ElevatedButton(onPressed: scnQR, child: Text("Start QR scan")),
              ElevatedButton(
                  onPressed: startBarcodeStream,
                  child: Text("Start barcode scan stream")),
              Text("Barcode result $_scanBarcodeResult")
            ],
          ),
        ),
      ),
    );
  }

  void scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  void scnQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  void startBarcodeStream() async {
    try {
      await FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff666",
        "cancel",
        true,
        ScanMode.BARCODE,
      )!
          .listen((barcode) {});
    } catch (e) {
      print(e);
    }
  }
}
