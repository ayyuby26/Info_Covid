
import 'dart:convert';
import 'package:http/http.dart' as http;

class Indonesia {
  String positif, sembuh, dirawat, meninggal;
  Indonesia({this.positif, this.sembuh, this.dirawat, this.meninggal});
  factory Indonesia.dataAPI(Map<String, dynamic> obj) {
    return Indonesia(
      positif: obj['positif'],
      sembuh: obj['sembuh'],
      dirawat: obj['dirawat'],
      meninggal: obj['meninggal'],
    );
  }
}

fetchdataAPI(_) async {
  try {
    var api = await http.get('https://api.kawalcorona.com/indonesia');
    var jsonObj = json.decode(api.body);
      List<Indonesia> users = [];
      for (int i = 0; i < jsonObj.length; i++)
        users.add(Indonesia.dataAPI(jsonObj[i]));
      return users;
  } catch (a) {
    print(a);
  }
}
