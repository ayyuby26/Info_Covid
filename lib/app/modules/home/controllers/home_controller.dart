import 'package:get/get.dart';
import 'package:info_covid/app/modules/home/national_model.dart';
import 'package:info_covid/app/modules/home/providers/national_provider.dart';
import 'package:info_covid/app/modules/home/providers/province_provider.dart';
import 'package:info_covid/app/modules/home/province_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var nationalData = NationalModel().obs;
  var provinceDataList = <ProvinceModel>[].obs;

  numFormat(dynamic x) {
    final _f = NumberFormat.decimalPattern();
    return _f.format(x);
  }

  getDate() {
    final date = DateTime.now();
    return DateFormat('EEEE, d MMMM y', "id").format(date);
  }

  final count = 0.obs;
  @override
  void onInit() async {
    initializeDateFormatting();
    provinceDataList(await ProvinceProvider().fetch());
    nationalData(await NationalProvider().getNational());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
