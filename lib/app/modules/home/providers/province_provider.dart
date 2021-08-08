import 'package:get/get.dart';
import 'package:info_covid/app/core/values/strings.dart';
import '../province_model.dart';

class ProvinceProvider extends GetConnect {
  Future<List<ProvinceModel>?> fetch() async {
    final _response = await get('$baseUrlApi/provinsi');
    try {
      final _data = _response.body as List;
      return _data.map((e) => ProvinceModel.fromJson(e['attributes'])).toList();
    } catch (e) {
      print("ProvinceProviderError $e");
    }
  }
}
