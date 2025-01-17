import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/screen/mainPart/mainScreen.dart';

class FoodDetailPage extends StatelessWidget {
  final String barcode;

  const FoodDetailPage({Key? key, required this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> recommendedProducts = [
      {
        'title': 'Barilla Spagetti Makarna',
        'calories': '359 kcal',
        'imageUrl': 'https://barkodist.com//assets/img/barilla-spagetti-makarna-500-g-barkodu.jpeg',
        'barcode': '8690579991117'
      },
      {
        'title': 'Nuh\'un Ankara Spagetti',
        'calories': '357 kcal',
        'imageUrl':
            'https://static.ticimax.cloud/36626/uploads/urunresimleri/buyuk/ankara-makarna-ince-spaghetti-500-gr-fb-6d5.jpg',
        'barcode': '8690576029004'
      },
    ];

    final Map<String, Map<String, String>> productDetails = {
      "8690526084671": {
        "name": "Eti Gong",
        "imageUrl": "https://barkodist.com//assets/img/eti-gong-misir-ve-pirinc-patlagi-64-g-barkodu.jpeg",
        "ingredients": "Mısır %37,7, Pirinç %34, Bitkisel yağ (palm), Tuz, Şeker",
        "calories": "294",
        "fat": "15.6",
        "carbohydrates": "68.9",
        "protein": "5.1"
      },
      "8680908020038": {
        "name": "Indomie Sebzeli Hazır Noodle",
        "imageUrl": "https://barkodist.com//assets/img/indomie-sebzeli-hazir-noodle-75-g-barkodu.jpeg",
        "ingredients": "Buğday Unu(Glüten), Palm Yağı, Tuz, Asitlik Düzenleyici, Sebze Tozu",
        "calories": "353",
        "fat": "15",
        "carbohydrates": "46",
        "protein": "8"
      },
      "8690579991117": {
        "name": "Barilla Spagetti Makarna (500 g)",
        "imageUrl": "https://barkodist.com//assets/img/barilla-spagetti-makarna-500-g-barkodu.jpeg",
        "ingredients": "Durum Buğdayı İrmiği, Su",
        "calories": "359",
        "fat": "2",
        "carbohydrates": "70.2",
        "protein": "13.5"
      },
      "8690637977619": {
        "name": "Atelier Gelarto Ekvador Çikolatalı Dondurma (430 ml)",
        "imageUrl": "https://images.migrosone.com/sanalmarket/product/11578824/11578824-8a0995-1650x1650.jpg",
        "ingredients": "Süt, Şeker, Kakao Kitlesi, Kakao Yağı, Emülgatör, Aroma Verici",
        "calories": "320",
        "fat": "20",
        "carbohydrates": "32",
        "protein": "5"
      }
    };

    final Map<String, String> ingredientDescriptions = {
      "Mısır":
          "Mısır, birçok gıda ürününde kullanılan bir tahıldır. Un, nişasta, mısır yağı ve çeşitli hazır gıdalarda bulunur.",
      "Pirinç":
          "Pirinç, dünya genelinde temel bir gıda maddesidir ve genellikle pilav, un ve çeşitli atıştırmalıkların yapımında kullanılır.",
      "Bitkisel yağ (palm)": "Palm yağı, genellikle yemeklik yağ olarak ve gıda endüstrisinde kullanılır.",
      "Tuz": "Tuz, yemeklere tat vermek ve koruyucu olarak kullanılan bir mineraldir.",
      "Şeker": "Şeker, tatlandırıcı olarak kullanılan doğal bir karbonhidrattır.",
      "Buğday Unu(Glüten)": "Buğday unu, ekmek, makarna ve diğer unlu mamullerin yapımında kullanılır.",
      "Asitlik Düzenleyici": "Asitlik düzenleyici maddeler, gıdaların pH seviyesini dengelemek için kullanılır.",
      "Sebze Tozu": "Sebze tozları, sebzelerin kurutulup öğütülmesiyle elde edilen toz halindeki malzemelerdir.",
      "Durum Buğdayı İrmiği": "Durum buğdayı irmiği, özellikle makarna yapımında kullanılan bir tür buğdaydır.",
      "Su": "Su, gıdalarda çözme ve nemlendirme amacıyla kullanılan temel bir bileşendir.",
      "Süt": "Süt, birçok gıda ürününde temel bir bileşendir ve besin değeri yüksektir.",
      "Kakao Kitlesi": "Kakao kitlesi, çikolata üretiminde kullanılan ana bileşendir.",
      "Kakao Yağı": "Kakao yağı, çikolata ve kozmetik ürünlerinde kullanılan doğal bir yağdır.",
      "Emülgatör": "Emülgatörler, yağ ve suyun karışmasını sağlayan katkı maddeleridir.",
      "Aroma Verici": "Aroma vericiler, gıdalara istenilen tadı ve kokuyu vermek için kullanılır.",
    };

    // Ürün bilgilerini al
    final product = productDetails[barcode];

    List<Widget> ingredientWidgets = [];
    if (product != null) {
      List<String> ingredients = product['ingredients']!.split(', ');
      for (var ingredient in ingredients) {
        var name = ingredient.split(' ')[0];
        var description = ingredientDescriptions[name] ?? "Bilgi mevcut değil.";
        ingredientWidgets.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
            child: Text(
              "$ingredient: $description",
              style: ComponentEditor.specialText(16, Colors.black),
            ),
          ),
        );
      }
    }

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: product != null
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ürün: ${product['name']}",
                      style: ComponentEditor.specialText(18, Colors.black, FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: Image.network(
                        product['imageUrl']!,
                        fit: BoxFit.cover,
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.2,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "İçindekiler:",
                      style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                    ),
                    ...ingredientWidgets,
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Besin Değerleri:",
                      style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Table(
                      border: TableBorder.all(color: Colors.black),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Kalori (kcal)',
                                style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Yağ (gr)',
                                style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Karbonhidrat (gr)',
                                style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Protein (gr)',
                                style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product['calories']!,
                                style: ComponentEditor.specialText(16, Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product['fat']!,
                                style: ComponentEditor.specialText(16, Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product['carbohydrates']!,
                                style: ComponentEditor.specialText(16, Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product['protein']!,
                                style: ComponentEditor.specialText(16, Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (barcode == "8680908020038") ...[
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "NutriMate size daha sağlıklı seçenekler öneriyor:",
                        style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: recommendedProducts
                            .map((recommendedProduct) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => FoodDetailPage(barcode: recommendedProduct['barcode']!));
                                    },
                                    child: FoodCard(
                                      title: recommendedProduct['title']!,
                                      calories: recommendedProduct['calories']!,
                                      imageUrl: recommendedProduct['imageUrl']!,
                                      barcode: recommendedProduct['barcode']!,
                                    ),
                                  ),
                            ))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              )
            : Text(
                "Ürün bilgisi bulunamadı.",
                style: ComponentEditor.specialText(18, Colors.black, FontWeight.bold),
              ),
      ),
    );
  }
}
