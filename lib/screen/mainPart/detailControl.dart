import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';

class FoodDetailPage extends StatelessWidget {
  final String barcode;

  const FoodDetailPage({Key? key, required this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final Map<String, Map<String, String>> productDetails = {
      "8690526074825": {
        "name": "Eti Gong",
        "ingredients": "Mısır %37,7, Pirinç %34, Bitkisel yağ (palm), Tuz, Şeker",
      },
      "8680908020038": {
        "name": "Indomie Sebzeli Hazır Noodle",
        "ingredients": "Buğday Unu(Glüten), Palm Yağı, Tuz, Asitlik Düzenleyici, Sebze Tozu",
      },
      "8690579991117": {
        "name": "Barilla Spagetti Makarna (500 g)",
        "ingredients": "Durum Buğdayı İrmiği, Su",
      },
      "8690637977619": {
        "name": "Atelier Gelarto Ekvador Çikolatalı Dondurma (430 ml)",
        "ingredients": "Süt, Şeker, Kakao Kitlesi, Kakao Yağı, Emülgatör, Aroma Verici",
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
        title: Text(
          "Barkod Detayları",
          style: ComponentEditor.specialText(screenWidth * 0.05, Colors.white, FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: product != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ürün: ${product['name']}",
                    style: ComponentEditor.specialText(18, Colors.black, FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "İçindekiler:",
                    style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                  ),
                  ...ingredientWidgets,
                ],
              )
            : Text(
                "Ürün bilgisi bulunamadı.",
                style: ComponentEditor.specialText(18, Colors.black, FontWeight.bold),
              ),
      ),
    );
  }
}
