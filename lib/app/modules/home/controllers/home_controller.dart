import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static double minHeight = 95, maxHeight = 300;
  var offset = Offset(0, minHeight).obs;
  var isOpen = false.obs;

  var wellness = [
    {
      'image':
          "https://southcity.co.id/wp-content/uploads/2021/04/Logo-tenant-8.jpg",
      'desc': 'Voucher Digital Indomaret Rp. 25.000',
      'price': 'Rp. 25.000',
    },
    {
      'image': "https://www.disnakerja.com/wp-content/uploads/2021/09/Grab.jpg",
      'desc': 'Voucher Digital Grab Transport Rp 20.000',
      'price': 'Rp. 20.000',
    },
    {
      'image': "https://www.disnakerja.com/wp-content/uploads/2021/09/Grab.jpg",
      'desc': 'Voucher Digital Grab Transport Rp. 50.000',
      'price': 'Rp. 50.000',
    },
    {
      'image':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfT6DtHxc-MkRKUAMJpZ4NkJ-MZn37c-ognw&s",
      'desc': 'Voucher Digital Ace Hardware Rp. 50.000',
      'price': 'Rp. 50.000',
    },
    {
      'image':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPkLdTSf4r2CNf_twmznz9N7C_TOaxOtTKwQ&s",
      'desc': 'Token Listrik PLN Rp. 200.000',
      'price': 'Rp. 200.000',
    },
    {
      'image':
          "https://southcity.co.id/wp-content/uploads/2021/04/Logo-tenant-8.jpg",
      'desc': 'Voucher Digital Indomaret Rp. 100.000',
      'price': 'Rp. 100.000',
    },
  ].obs;

  void handleClick() {
    isOpen.value = !isOpen.value;
    Timer.periodic(Duration(milliseconds: 2), (timer) {
      if (isOpen.value) {
        double value = offset.value.dy + 10; // increment the height
        offset.value = Offset(0, value);
        if (offset.value.dy > maxHeight) {
          offset.value =
              Offset(0, maxHeight); // ensure it doesn't exceed maxHeight
          timer.cancel();
        }
      } else {
        double value = offset.value.dy - 10; // decrement the height
        offset.value = Offset(0, value);
        if (offset.value.dy < minHeight) {
          offset.value =
              Offset(0, minHeight); // ensure it doesn't go below minHeight
          timer.cancel();
        }
      }
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    offset.value = Offset(0, offset.value.dy - details.delta.dy);
    if (offset.value.dy < minHeight) {
      offset.value = Offset(0, minHeight);
      isOpen.value = false;
    } else if (offset.value.dy > maxHeight) {
      offset.value = Offset(0, maxHeight);
      isOpen.value = true;
    }
  }

  void closeBottomSheet() {
    isOpen.value = false;
    Timer.periodic(Duration(milliseconds: 5), (timer) {
      double value = offset.value.dy - 10;
      offset.value = Offset(0, value);
      if (offset.value.dy <= minHeight) {
        offset.value = Offset(0, minHeight);
        timer.cancel();
      }
    });
  }

  void _animateBottomSheet() {
    Timer.periodic(Duration(milliseconds: 5), (timer) {
      if (isOpen.value) {
        double value = offset.value.dy + 10; // Increment the height
        offset.value = Offset(0, value);
        if (offset.value.dy > maxHeight) {
          offset.value =
              Offset(0, maxHeight); // Ensure it doesn't exceed maxHeight
          timer.cancel();
        }
      } else {
        double value = offset.value.dy - 10; // Decrement the height
        offset.value = Offset(0, value);
        if (offset.value.dy < minHeight) {
          offset.value =
              Offset(0, minHeight); // Ensure it doesn't go below minHeight
          timer.cancel();
        }
      }
    });
  }
}
