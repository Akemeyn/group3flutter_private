import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/components/pageConttoller.dart';
import 'package:nutrijourney/screen/assistantPart/barcodeScanner.dart';
import 'package:nutrijourney/screen/assistantPart/detailControl.dart';
import 'package:nutrijourney/screen/assistantPart/recipe.dart';
import 'package:nutrijourney/screen/mainPart/chatbot.dart';
import 'package:nutrijourney/screen/mainPart/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageControllerManager pageControllerManager = Get.find();

  final List<Map<String, String>> healthyFoods = [
    {
      'title': 'Avokado Tostu',
      'calories': '140 kcal',
      'imageUrl': 'https://cdn.yemek.com/mnresize/940/940/uploads/2020/04/avokado-tost-editor.jpg',
      'ingredients': '1 adet Avokado, 2 dilim Tam buğday ekmeği, 1 adet Limon, 1 çay kaşığı Tuz',
      'construction':
          'Avokadoyu ortadan ikiye bölün ve çekirdeğini çıkarın,,, İç kısmını bir kaseye alın ve çatal yardımıyla ezin,,, Tam buğday ekmeklerini kızartın,,, Ezilmiş avokadoyu kızarmış ekmek dilimlerinin üzerine sürün,,, Üzerine limon suyu sıkın ve tuz serpin,,, Hemen servis yapın',
      'protein': '3.0',
      'carbs': '20.0',
      'fat': '10.0'
    },
    {
      'title': 'Sebze Karışımı',
      'calories': '260 kcal',
      'imageUrl': 'https://i.ytimg.com/vi/jacXXaw0uow/maxresdefault.jpg',
      'ingredients':
          '1 adet Havuç, 1 baş Brokoli, 1 adet Kırmızı biber, 1 adet Kabak, 2 yemek kaşığı Zeytinyağı, 1 çay kaşığı Tuz, 1 çay kaşığı Karabiber',
      'construction':
          'Havucu ince dilimler halinde doğrayın,,, Brokoliyi küçük parçalara ayırın,,, Kırmızı biberi ve kabağı jülyen şeklinde doğrayın,,, Zeytinyağını büyük bir tavada ısıtın,,, Doğranmış sebzeleri tavaya ekleyin ve orta ateşte soteleyin,,, Tuz ve karabiber ekleyerek tatlandırın,,, Sebzeler yumuşayıncaya kadar pişirin ve servis yapın',
      'protein': '4.0',
      'carbs': '30.0',
      'fat': '12.0'
    },
    {
      'title': 'Yulaf Ezmesi',
      'calories': '200 kcal',
      'imageUrl': 'https://cdn.yemek.com/mnresize/940/940/uploads/2020/02/yulaf-ezmesii.jpg',
      'ingredients': '50 gr Yulaf, 200 ml Süt, 1 yemek kaşığı Bal, 1 adet Muz',
      'construction':
          'Yulafı ve sütü bir tencereye alın,,, Orta ateşte sürekli karıştırarak pişirin,,, Kıvam alana kadar karıştırmaya devam edin,,, Pişen yulaf ezmesini bir kaseye alın,,, Üzerine bal ekleyin ve karıştırın,,, Muz dilimlerini üzerine yerleştirin ve servis yapın',
      'protein': '5.0',
      'carbs': '35.0',
      'fat': '5.0'
    },
    {
      'title': 'Yaban Mersinli Yoğurt',
      'calories': '100 kcal',
      'imageUrl': 'https://www.verita.com.tr/wp-content/uploads/Brsr_8376172.jpg',
      'ingredients': '200 gr Yoğurt, 1 yemek kaşığı Bal, 50 gr Yaban mersini',
      'construction':
          'Yoğurdu bir kaseye alın,,, Üzerine bal ekleyin ve karıştırın,,, Yaban mersinlerini yoğurdun üzerine serpin,,, Soğuk olarak servis yapın',
      'protein': '6.0',
      'carbs': '15.0',
      'fat': '2.0'
    },
    {
      'title': 'Somon',
      'calories': '220 kcal',
      'imageUrl': 'https://kuletower.com/wp-content/uploads/2020/04/NORVE%C3%87-IZGARA-SOMON.jpg',
      'ingredients':
          '150 gr Somon fileto, 2 yemek kaşığı Zeytinyağı, 1 adet Limon, 1 çay kaşığı Tuz, 1 çay kaşığı Karabiber',
      'construction':
          'Somon filetolarını zeytinyağı ile iyice yağlayın,,, Üzerine tuz ve karabiber serpin,,, Izgarayı orta ateşte ısıtın ve somon filetolarını ızgaraya yerleştirin,,, Her iki tarafını da 3-4 dakika pişirin,,, Pişen somonları servis tabağına alın,,, Üzerine limon suyu sıkın ve sıcak servis yapın',
      'protein': '25.0',
      'carbs': '0.0',
      'fat': '14.0'
    }
  ];

  final List<Map<String, String>> worldCuisines = [
    {
      'title': 'Sushi',
      'calories': '200 kcal',
      'imageUrl': 'https://cdn.yemek.com/mnresize/940/940/uploads/2020/04/sushi-tarifi.jpg',
      'ingredients': '200 gr Sushi pirinci, 2 adet Nori yaprağı, 100 gr Somon, 1 adet Avokado',
      'construction':
          'Sushi pirincini iyice yıkayın ve süzün,,, Pirinci, paketin üzerindeki talimatlara göre pişirin,,, Nori yapraklarını düz bir zemine serin,,, Pişmiş pirinci nori yapraklarının üzerine ince bir tabaka halinde yayın,,, Somon dilimlerini pirincin üzerine yerleştirin,,, Avokadoyu ince dilimler halinde kesin ve somonun üzerine ekleyin,,, Nori yaprağını dikkatlice rulo şeklinde sarın,,, Ruloyu keskin bir bıçakla dilimleyin ve servis yapın',
      'protein': '12.0',
      'carbs': '34.0',
      'fat': '8.0'
    },
    {
      'title': 'Tacos',
      'calories': '300 kcal',
      'imageUrl': 'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos-1024x767.jpg',
      'ingredients': '2 adet Tortilla, 150 gr Kıyma, 1 adet Domates, 2 yaprak Marul, 50 gr Peynir',
      'construction':
          'Kıymayı orta ateşte pişirin,,, Tortillanın içine pişmiş kıymayı koyun,,, Üzerine doğranmış domates, marul ve rendelenmiş peynir ekleyin,,, Tacosu katlayarak servis yapın',
      'protein': '15.0',
      'carbs': '40.0',
      'fat': '20.0'
    },
    {
      'title': 'Pad Thai',
      'calories': '400 kcal',
      'imageUrl':
          'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/7DE647CE-2E09-4CBE-88EE-CFFCC70D7440/Derivates/F8CA1C89-596A-4EC0-9A63-6505DDBD528C.jpg',
      'ingredients': '200 gr Pirinç eriştesi, 100 gr Tavuk, 2 adet Yumurta, 50 gr Soğuk soya fasulyesi',
      'construction':
          'Erişteyi paketin üzerindeki talimatlara göre haşlayın,,, Tavuğu küçük parçalar halinde doğrayın ve pişirin,,, Yumurta ekleyip karıştırarak pişirin,,, Haşlanmış erişteyi ve soya fasulyesini ekleyin ve iyice karıştırın',
      'protein': '25.0',
      'carbs': '50.0',
      'fat': '15.0'
    },
    {
      'title': 'Paella',
      'calories': '350 kcal',
      'imageUrl': 'https://cdn.yemek.com/mnresize/940/940/uploads/2015/05/paella-guncelleme-sunum.jpg',
      'ingredients': '200 gr Pirinç, 150 gr Deniz mahsulleri, 3 yemek kaşığı Zeytinyağı, 1 tutam Safran',
      'construction':
          'Pirinç ve safranı sıcak suyla haşlayın,,, Zeytinyağını geniş bir tavada ısıtın,,, Deniz mahsullerini ekleyin ve pişirin,,, Haşlanmış pirinci ekleyip karıştırın ve bir süre pişirin',
      'protein': '20.0',
      'carbs': '45.0',
      'fat': '10.0'
    },
    {
      'title': 'Ratatouille',
      'calories': '250 kcal',
      'imageUrl':
          'https://www.allrecipes.com/thmb/F1rucOY3FQT5Ic0oyxdLoqU_yKc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/222006-disneys-ratatouille-DDMFS-4x3-36eb15843ab548a79e7aab761dac92e1.jpg',
      'ingredients': '1 adet Patlıcan, 1 adet Kabak, 2 adet Domates, 3 yemek kaşığı Zeytinyağı',
      'construction':
          'Patlıcan, kabak ve domatesi ince dilimler halinde kesin,,, Zeytinyağını tavada ısıtın,,, Sebzeleri tavaya ekleyip soteleyin,,, Sebzeleri bir fırın kabına dizip 200 derecede 20 dakika pişirin',
      'protein': '5.0',
      'carbs': '30.0',
      'fat': '15.0'
    }
  ];

  final List<Map<String, String>> healthySnacks = [
    {
      'title': 'Eti Gong',
      'calories': '294 kcal',
      'imageUrl': 'https://barkodist.com//assets/img/eti-gong-misir-ve-pirinc-patlagi-64-g-barkodu.jpeg',
      'barcode': '8690526084671'
    },
    {
      'title': 'Indomie Sebzeli Hazır Noodle',
      'calories': '353 kcal',
      'imageUrl': 'https://barkodist.com//assets/img/indomie-sebzeli-hazir-noodle-75-g-barkodu.jpeg',
      'barcode': '8680908020038'
    },
    {
      'title': 'Barilla Spagetti Makarna',
      'calories': '359 kcal',
      'imageUrl': 'https://barkodist.com//assets/img/barilla-spagetti-makarna-500-g-barkodu.jpeg',
      'barcode': '8690579991117'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NutriJourney',
          style: ComponentEditor.specialText(screenHeight * 0.03, Colors.white, FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorController.soDarkJungleGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.barcode_reader,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(() => const BarcodeScanner());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: const Text(
                  'NutriMate\'in İncelediği Ürünler',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: healthySnacks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => FoodDetailPage(barcode: healthySnacks[index]['barcode']!));
                        },
                        child: FoodCard(
                          title: healthySnacks[index]['title']!,
                          calories: healthySnacks[index]['calories']!,
                          imageUrl: healthySnacks[index]['imageUrl']!,
                          barcode: healthySnacks[index]['barcode']!,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: const Text(
                  'Sağlıklı Besinler',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: healthyFoods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => RecipePage(
                                name: healthyFoods[index]['title']!,
                                ingredients: healthyFoods[index]['ingredients']!,
                                construction: healthyFoods[index]['construction']!,
                                protein: healthyFoods[index]['protein']!,
                                carbs: healthyFoods[index]['carbs']!,
                                fat: healthyFoods[index]['fat']!,
                                imageUrl: healthyFoods[index]['imageUrl']!,
                                calories: healthyFoods[index]['calories']!,
                              ));
                        },
                        child: FoodCard(
                          title: healthyFoods[index]['title']!,
                          calories: healthyFoods[index]['calories']!,
                          imageUrl: healthyFoods[index]['imageUrl']!,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: const Text(
                  'Dünya Mutfaklarından Tarifler',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: worldCuisines.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => RecipePage(
                                name: worldCuisines[index]['title']!,
                                ingredients: worldCuisines[index]['ingredients']!,
                                construction: worldCuisines[index]['construction']!,
                                protein: worldCuisines[index]['protein']!,
                                carbs: worldCuisines[index]['carbs']!,
                                fat: worldCuisines[index]['fat']!,
                                imageUrl: worldCuisines[index]['imageUrl']!,
                                calories: worldCuisines[index]['calories']!,
                              ));
                        },
                        child: FoodCard(
                          title: worldCuisines[index]['title']!,
                          calories: worldCuisines[index]['calories']!,
                          imageUrl: worldCuisines[index]['imageUrl']!,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String calories;
  final String imageUrl;
  final String barcode;

  const FoodCard({
    super.key,
    required this.title,
    required this.calories,
    required this.imageUrl,
    this.barcode = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 150,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                      title,
                      style: ComponentEditor.specialText(16, Colors.black, FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, size: 16.0),
                    const SizedBox(width: 4.0),
                    Text(
                      calories,
                      style: ComponentEditor.specialText(14, Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final PageControllerManager pageControllerManager = Get.put(PageControllerManager());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Obx(() => WillPopScope(
          onWillPop: () async {
            if (pageControllerManager.selectedIndex.value > 0) {
              pageControllerManager.changePage(pageControllerManager.selectedIndex.value - 1);
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: PageView(
              controller: pageControllerManager.pageController,
              children: [
                HomeScreen(),
                ChatScreen(),
                ProfileScreen(),
              ],
              physics: const NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: ColorController.jungleGreen),
                  label: 'Ana Sayfa',
                  backgroundColor: ColorController.jungleGreen,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.data_usage, color: ColorController.jungleGreen),
                  label: "NutriMate",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: ColorController.jungleGreen),
                  label: 'Profil',
                ),
              ],
              currentIndex: pageControllerManager.selectedIndex.value,
              selectedItemColor: ColorController.jungleGreen,
              onTap: (index) {
                pageControllerManager.changePage(index);
              },
            ),
          ),
        ));
  }
}
