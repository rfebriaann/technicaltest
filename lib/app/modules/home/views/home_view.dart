// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:technicaltest/app/modules/home/controllers/home_controller.dart';
import 'package:technicaltest/app/modules/profile/views/profile_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final HomeController controller = Get.put(HomeController());

    // Define pages
    // final List<Widget> pages = [
    //   Center(child: Text('Home')),
    //   Center(child: Text('Search')),
    //   Center(child: Text('Profile')),
    // ];

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      // appBar: AppBar(backgroundColor: Color(0xFFF6F6F6), elevation: 0),
      appBar: AppBar(
        backgroundColor: Color(0xffF8C209),
        // toolbarHeight: 70,
        leadingWidth: 140,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Pagi",
                style: TextStyle(
                    fontSize: 13,
                    letterSpacing: -0.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Rafli Febrian",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 0),
          //   child: Container(
          //     // ignore: prefer_const_constructors
          //     child: CircleAvatar(
          //       backgroundColor: Colors.grey,
          //       child: Text("R"),
          //     ),
          //   ),
          // ),
          Icon(
            Icons.notifications_outlined,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Get.to(ProfileView()),
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    "R",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          if (controller.isOpen.value) {
            controller.closeBottomSheet(); // Close when clicked outside
          }
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Obx(
            //     () => FloatingActionButton(
            //       onPressed: controller.handleClick,
            //       splashColor: Colors.transparent,
            //       // textColor: Colors.grey,
            //       child: Text(controller.isOpen.value ? "Back" : ""),
            //     ),
            //   ),
            // ),
            Align(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Produk Keuangan",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5),
                            ),
                            GridView.count(
                              crossAxisCount: 4, // Display items in 2 columns
                              crossAxisSpacing: 10.0,
                              shrinkWrap:
                                  true, // Make it shrink to fit its content
                              physics:
                                  NeverScrollableScrollPhysics(), // Disable scroll
                              children: [
                                _buildGridItem("assets/user.svg", "Urun",
                                    Color(0xffa98d30)),
                                _buildGridItem("assets/gps.svg", "Porsi Haji",
                                    Color(0xff62ac6f)),
                                _buildGridItem("assets/graph.svg", "Financial",
                                    Color(0xffeec020)),
                                _buildGridItem("assets/steering-wheel.svg",
                                    "Mobil", Color(0xff567ea2)),
                                _buildGridItem("assets/home.svg", "Properti",
                                    Color(0xffee8178)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kategori Pilihan",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5),
                            ),
                            GridView.count(
                              crossAxisCount: 4, // Display items in 2 columns
                              crossAxisSpacing: 10.0,
                              shrinkWrap:
                                  true, // Make it shrink to fit its content
                              physics:
                                  NeverScrollableScrollPhysics(), // Disable scroll
                              children: [
                                _buildGridItem("assets/balloon.svg", "Hobi",
                                    Color(0xff3893d2)),
                                _buildGridItem("assets/shirt.svg",
                                    "Merhcandise", Color(0xff2299f1)),
                                _buildGridItem("assets/lungs.svg",
                                    "Hidup sehat", Color(0xfffc724d)),
                                _buildGridItem("assets/message.svg",
                                    "Konseling", Color(0xff008ff2)),
                                _buildGridItem("assets/radar.svg", "Self dev",
                                    Color(0xff656dcf)),
                                _buildGridItem("assets/credit-card.svg",
                                    "Keuangan", Color(0xff408a74)),
                                _buildGridItem("assets/medical-cross.svg",
                                    "Kon. Medis", Color(0xff199978)),
                                _buildGridItem("assets/apps.svg", "Lihat Semua",
                                    Color(0xff697683)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Explore Wellness",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5),
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20.0,
                                  mainAxisSpacing: 20.0,
                                  childAspectRatio: 1.5 / 2,
                                ),
                                itemCount: controller.wellness.length,
                                itemBuilder: (context, index) {
                                  var wellness = controller.wellness[index];
                                  return Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                topRight: Radius.circular(15.0),
                                              ),
                                              child: Image.network(
                                                "${wellness['image']}",
                                                height: 110.0,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("${wellness['desc']}"),
                                            Text("${wellness['price']}"),
                                          ],
                                        ),
                                      ));
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onPanUpdate: (details) => controller.onPanUpdate(details),
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration.zero,
                  curve: Curves.easeOut,
                  height: controller.offset.value.dy,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.count(
                      crossAxisCount: 3, // 3 columns
                      crossAxisSpacing: 30.0,
                      physics: NeverScrollableScrollPhysics(),
                      // mainAxisSpacing: 0.0,
                      children: [
                        _buildMenuItem("assets/smart-home.svg", "Beranda", () {
                          print("Home clicked");
                        }),
                        _buildMenuItem("assets/search.svg", "Cari", () {
                          print("Profile clicked");
                        }),
                        _buildMenuItem("assets/shopping-cart.svg", "Keranjang",
                            () {
                          print("Settings clicked");
                        }),
                        _buildMenuItem(
                            "assets/cash-register.svg", "Daftar Transaksi", () {
                          print("Logout clicked");
                        }),
                        _buildMenuItem("assets/gift-card.svg", "Voucher Saya",
                            () {
                          print("Info clicked");
                        }),
                        _buildMenuItem("assets/map-pin.svg", "Alamat", () {
                          print("Help clicked");
                        }),
                        _buildMenuItem("assets/users.svg", "Daftar Teman", () {
                          print("Help clicked");
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Positioned(
                bottom: 2 * HomeController.minHeight -
                    controller.offset.value.dy -
                    28, // adjust for FAB height
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  elevation: 0,
                  onPressed: controller.handleClick,
                  child: Icon(controller.isOpen.value
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMenuItem(String assetName, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(icon,
        //     size: 35.0,
        //     color: Colors.blue), // Icon with a custom size and color
        SvgPicture.asset(
          assetName,
          width: 38,
          height: 38,
          color: Colors.black,

          // color: colours,
        ),
        // SizedBox(height: 3.0),
        Text(label, style: TextStyle(fontSize: 12.0, color: Colors.black)),
      ],
    ),
  );
}

Widget _buildGridItem(String assetName, String label, Color colours) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Icon(icon, size: 35.0, color: Colors.blue),
      SvgPicture.asset(
        assetName,
        width: 38,
        height: 38,
        color: colours,
      ),
      // SizedBox(height: .0),
      Text(label, style: TextStyle(fontSize: 12.0, color: Colors.black)),
    ],
  );
}

Widget _buildCardItem(String imageUrl, String description, String price) {
  return Card(
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image section
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: Image.network(
            imageUrl,
            height: 100.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product description
              Text(
                description,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5),
              ),
              // SizedBox(height: 8.0),
              // Product price
              Text(
                price,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
