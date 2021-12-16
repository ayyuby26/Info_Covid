import 'package:covid_app/app/core/values/base_url.dart';
import 'package:get/get.dart';
import '../national_model.dart';

class NationalProvider extends GetConnect {
  Future<NationalModel?> getNational() async {
    final _response = await get('$baseUrlApi');
    try {
      return NationalModel.fromJson(_response.body[0]);
    } catch (e) {
      print("NationalProviderError $e");
    }
  }
}
