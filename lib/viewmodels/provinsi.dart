
import 'dart:convert';
import 'package:http/http.dart' as http;

class Provinsi {
  String namaprovinsi;
  int kasusPosi, kasusSemb, kasusMeni;
  Provinsi({this.namaprovinsi, this.kasusPosi, this.kasusSemb, this.kasusMeni});
  factory Provinsi.dataAPI(Map<String, dynamic> obj) {
    return Provinsi(
      namaprovinsi: obj['Provinsi'],
      kasusPosi: obj['Kasus_Posi'],
      kasusSemb: obj['Kasus_Semb'],
      kasusMeni: obj['Kasus_Meni'],
    );
  }
}

class Attributes{
  Provinsi atribut;
  Attributes({this.atribut});
  factory Attributes.dataAPI(Map<String, dynamic> obj) {
    return Attributes(
      atribut: Provinsi.dataAPI(obj['attributes']),
    );
  }
}
fetchdataAPIProvinsi(_) async {
  try {
    var api = await http.get('https://api.kawalcorona.com/indonesia/provinsi/');
    var jsonObj = json.decode(api.body);
      List<Attributes> users = [];
      for (int i = 0; i < jsonObj.length; i++)
        users.add(Attributes.dataAPI(jsonObj[i]));
      return users;
  } catch (a) {
    print(a);
  }
}

