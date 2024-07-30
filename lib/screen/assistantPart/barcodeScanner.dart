import 'package:flutter/material.dart';
import 'package:nutrijourney/screen/assistantPart/detailControl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorController.soDarkJungleGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Icon(
          Icons.barcode_reader,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1,
                  vertical: screenHeight * 0.03,
                ),
                child: Text(
                  "Barkod Okuma Talimatları",
                  style: ComponentEditor.specialText(screenWidth * 0.045, Colors.black, FontWeight.bold),
                ),
              ),
              ...instructions(
                  "1. Barkodun Hazırlanması:",
                  "☉ Barkodu net bir şekilde görebileceğiniz bir alana yerleştirin.",
                  "☉ Barkodun etrafında gereksiz nesnelerin olmadığından emin olun.",
                  screenHeight,
                  screenWidth),
              ...instructions("2. Kamerayı Kullanma:", "☉ Cihazınızın kamerasını barkoda doğru tutun.",
                  "☉ Kamerayı barkoda mümkün olduğunca yakın tutun, ancak netliği koruyun.", screenHeight, screenWidth),
              ...instructions(
                  "3. Barkodu Tara:",
                  "☉ Barkodun kamera ekranında net bir şekilde göründüğünden emin olun.",
                  "☉ Kamerayı sabit tutun ve tarayıcının barkodu tanımasını bekleyin.",
                  screenHeight,
                  screenWidth),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: SizedBox(
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                      onPressed: () async {
                        /* var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SimpleBarcodeScannerPage(
                                cancelButtonText: "Geri Dön",
                                lineColor: "#58D68D",
                                isShowFlashIcon: true,
                              ),
                            )); */
                        var res = "8690526074825";
                        if (res != null) {
                          Get.to(() => FoodDetailPage(barcode: res));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorController.darkJungleGreen.withOpacity(0.8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                      child: Text(
                        "Barkod Taramayı Başlat",
                        style: ComponentEditor.specialText(screenWidth * 0.06, Colors.white, FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> instructions(String text1, String text2, String text3, double screenHeight, double screenWidth) {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.01),
        child: Text(
          text1,
          style: ComponentEditor.specialText(
            screenWidth * 0.04,
            Colors.black,
            FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Text(
          text2,
          style: ComponentEditor.specialText(
            screenWidth * 0.035,
            Colors.black,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
        child: Text(
          text3,
          style: ComponentEditor.specialText(
            screenWidth * 0.035,
            Colors.black,
          ),
        ),
      ),
      SizedBox(
        height: screenHeight * 0.04,
      )
    ];
  }
}
