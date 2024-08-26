import 'package:get/get.dart';
import 'package:technicaltest/app/modules/informasi/views/informasi_view.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  var items = [
    {
      'icon': "assets/userpersonal.svg",
      'name': 'Informasi Pribadi',
      'route': InformasiView()
    },
    {
      'icon': "assets/clipboard.svg",
      'name': 'Syarat & Ketentuan',
      'route': InformasiView()
    },
    {
      'icon': "assets/message-circle.svg",
      'name': 'Bantuan',
      'route': InformasiView()
    },
    {
      'icon': "assets/shield-check.svg",
      'name': 'Kebijakan Privasi',
      'route': InformasiView()
    },
    {
      'icon': "assets/logout.svg",
      'name': 'Log Out',
      'route': InformasiView(),
    },
    {
      'icon': "assets/trash.svg",
      'name': 'Hapus Akun',
      'route': InformasiView()
    },
  ].obs;
}
