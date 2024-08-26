// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: Get.height / 10,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      minRadius: 10,
                      maxRadius: 40,
                      backgroundColor: Colors.grey,
                      child: Text(
                        "R",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rafli Febrian",
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Masuk dengan Google",
                            style: TextStyle(letterSpacing: -0.5),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      var item = controller.items[index];
                      return ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 4),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            // child: Icon(item['icon'] as IconData),
                            child: SvgPicture.asset('${item['icon']}'),
                          ),
                        ),
                        title: Text(item['name'].toString()), // Nama item
                        onTap: () {
                          Get.to(item['route']);
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
