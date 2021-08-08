import 'package:get/get.dart';
import 'package:info_covid/app/core/values/strings.dart';
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
