import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:technicaltest/app/data/models/Personal.dart';
import 'package:technicaltest/app/data/providers/PersonalDatabase.dart';
// import 'package:image_picker/image_picker.dart';

class InformasiController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  var currentStep = 0.obs;

  var fullName = ''.obs;
  var birthDate = DateTime.now().obs;
  var gender = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var lastEducation = ''.obs;
  var statusOption = ''.obs;
  var address = ''.obs;
  var province = ''.obs;
  var city = ''.obs;
  var pos = ''.obs;
  var company = ''.obs;
  var position = ''.obs;
  var ktpImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  final genderOptions = ['Laki-laki', 'Perempuan'];
  final List<String> educationOptions = [
    'SD',
    'SMP',
    'SMA',
    'D1',
    'D2',
    'D3',
    'S1',
    'S2',
    'S3',
  ];
  final List<String> statusOptions = [
    'Belum Kawin',
    'Kawin',
    'Janda',
    'Duda',
  ];

  final List<String> Provinces = [
    'Jakarta',
    'Sumatera Utara',
    'Jawa Tengah',
    'Riau',
  ];
  final List<String> Cities = [
    'Jakarta Utara',
    'Jakarta Selatan',
    'Jakarta Barat',
    'Jakarta Timur',
  ];

  void selectBirthDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != birthDate.value) {
      birthDate.value = pickedDate;
    }
  }

  void nextStep() {
    if (currentStep.value < 2) {
      currentStep.value += 1;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value -= 1;
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ktpImage.value = File(pickedFile.path);
    }
  }

  Future<void> captureImageWithCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      ktpImage.value = File(pickedFile.path);
    }
  }

  Future<void> saveData() async {
    PersonalInfo info = PersonalInfo(
      fullName: fullName.value,
      birthDate: DateFormat('dd MMMM yyyy').format(birthDate.value),
      gender: gender.value,
      email: email.value,
      phoneNumber: phoneNumber.value,
      lastEducation: lastEducation.value,
      address: address.value,
      province: province.value,
      city: city.value,
      pos: pos.value,
      company: company.value,
      position: position.value,
      ktpImagePath: ktpImage.value?.path,
    );

    await _dbHelper.insertPersonalInfo(info);
    print("Data berhasil disimpan ke database!");
  }
}
