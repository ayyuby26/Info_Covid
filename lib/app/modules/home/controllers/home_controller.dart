import 'package:covid_app/app/modules/home/providers/national_provider.dart';
import 'package:covid_app/app/modules/home/providers/province_provider.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../national_model.dart';
import '../province_model.dart';

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
}
