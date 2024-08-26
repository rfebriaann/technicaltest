import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  final InformasiController controller = Get.put(InformasiController());
  InformasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Tracker Form')),
      body: Obx(() {
        return Column(
          children: [
            // Easy Stepper Implementation
            EasyStepper(
              finishedStepBorderColor: Colors.amberAccent,
              finishedStepTextColor: Colors.black87,
              finishedStepBackgroundColor: Colors.amberAccent,
              activeStepIconColor: Colors.white,
              activeStepBackgroundColor: Colors.amberAccent,
              unreachedStepBackgroundColor: Color.fromARGB(255, 247, 222, 148),
              unreachedStepIconColor: Colors.white,

              borderThickness: 0,
              stepBorderRadius: 0,
              showStepBorder: false,
              showLoadingAnimation: false,
              lineStyle: LineStyle(
                lineType: LineType.normal,
                lineLength: 70,
                lineWidth: 1,
              ),
              activeStep: controller.currentStep.value,
              steps: [
                EasyStep(
                  icon: Icon(Icons.person),
                  title: 'Biodata Diri',
                ),
                EasyStep(
                  icon: Icon(Icons.home),
                  title: 'Alamat Pribadi',
                ),
                EasyStep(
                  icon: Icon(Icons.business),
                  title: 'Informasi Perusahaan',
                ),
              ],
              onStepReached: (index) {
                controller.currentStep.value = index;
              },
              activeStepTextColor: Colors.amber,
              // finishedStepTextColor: Colors.green,
              // lineLength: 70,
            ),
            Expanded(
              child: StepContent(controller: controller),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.currentStep.value > 0)
                    ElevatedButton(
                      onPressed: controller.previousStep,
                      child: Text('Kembali'),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.currentStep.value == 2) {
                        controller.saveData();
                      } else {
                        controller.nextStep();
                      }
                    },
                    child: Text(controller.currentStep.value == 2
                        ? 'Selesai'
                        : 'Lanjut'),
                  ),
                  // ElevatedButton(
                  //   onPressed: controller.nextStep,
                  //   child: Text(controller.currentStep.value == 2
                  //       ? 'Selesai'
                  //       : 'Lanjut'),
                  // ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class StepContent extends StatelessWidget {
  final InformasiController controller;

  StepContent({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0:
          return buildBiodataForm();
        case 1:
          return buildAddressForm();
        case 2:
          return buildCompanyForm();
        default:
          return buildBiodataForm();
      }
    });
  }

  Widget buildBiodataForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: InputDecoration(hintText: 'Nama Lengkap'),
            onChanged: (value) {
              controller.fullName.value = value;
            },
          ),
          SizedBox(height: 16),
          Text('Tanggal Lahir', style: TextStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () => controller.selectBirthDate(Get.context!),
            child: AbsorbPointer(
              child: TextFormField(
                controller: TextEditingController(
                  text: DateFormat('dd MMMM yyyy')
                      .format(controller.birthDate.value),
                ),
                decoration: InputDecoration(
                  hintText: 'Tanggal Lahir',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Jenis Kelamin', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButtonFormField<String>(
            value: controller.gender.value.isNotEmpty
                ? controller.gender.value
                : null,
            items: controller.genderOptions.map((gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (value) {
              controller.gender.value = value!;
            },
            decoration: InputDecoration(
              hintText: 'Pilih Jenis Kelamin',
            ),
          ),
          SizedBox(height: 16),
          Text('Alamat Email', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: InputDecoration(hintText: 'Alamat Email'),
            onChanged: (value) {
              controller.email.value = value;
            },
          ),
          SizedBox(height: 16),
          Text('No. HP', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: InputDecoration(hintText: 'No. HP'),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              controller.phoneNumber.value = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text('Pendidikan Terakhir',
              style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButtonFormField<String>(
            value: controller.lastEducation.value.isNotEmpty
                ? controller.lastEducation.value
                : null,
            items: controller.educationOptions.map((education) {
              return DropdownMenuItem(
                value: education,
                child: Text(education),
              );
            }).toList(),
            onChanged: (value) {
              controller.lastEducation.value = value!;
            },
            decoration: InputDecoration(
              hintText: 'Pilih Pendidikan Terakhir',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddressForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Unggah KTP', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Obx(() {
            return controller.ktpImage.value == null
                ? Text('Belum ada gambar yang diunggah')
                : Image.file(controller.ktpImage.value!, height: 200);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  controller.pickImageFromGallery();
                },
                icon: Icon(Icons.photo),
                label: Text('Galeri'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  controller.captureImageWithCamera();
                },
                icon: Icon(Icons.camera),
                label: Text('Kamera'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Alamat Sesuai KTP',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            // initialValue: 'singularity.ind@gmail.com',
            decoration: InputDecoration(hintText: 'Alamat Sesuai KTP'),
            onChanged: (value) {
              controller.address.value = value;
            },
          ),
          SizedBox(height: 16),
          Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButtonFormField<String>(
            value: controller.province.value.isNotEmpty
                ? controller.province.value
                : null,
            items: controller.Provinces.map((province) {
              return DropdownMenuItem(
                value: province,
                child: Text(province),
              );
            }).toList(),
            onChanged: (value) {
              controller.province.value = value!;
            },
            decoration: InputDecoration(
              hintText: 'Pilih Provinsi',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text('Kota/Kabupaten', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButtonFormField<String>(
            value:
                controller.city.value.isNotEmpty ? controller.city.value : null,
            items: controller.Cities.map((city) {
              return DropdownMenuItem(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (value) {
              controller.city.value = value!;
            },
            decoration: InputDecoration(
              hintText: 'Pilih Kota/Kabupaten',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: InputDecoration(hintText: 'Kode Pos'),
            onChanged: (value) {
              controller.pos.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildCompanyForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama Perusahaan',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            // initialValue: 'singularity.ind@gmail.com',
            decoration: InputDecoration(hintText: 'Nama Perusahaan'),
            onChanged: (value) {
              controller.company.value = value;
            },
          ),
          SizedBox(height: 16),
          Text('Posisi', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: InputDecoration(hintText: 'Jabatan'),
            onChanged: (value) {
              controller.position.value = value;
            },
          ),
        ],
      ),
    );
  }
}
