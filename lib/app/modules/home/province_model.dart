class ProvinceModel {
  int? fID;
  int? kodeProvi;
  String? provinsi;
  int? kasusPosi;
  int? kasusSemb;
  int? kasusMeni;

  ProvinceModel({
    this.fID,
    this.kodeProvi,
    this.provinsi,
    this.kasusPosi,
    this.kasusSemb,
    this.kasusMeni,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      fID: json['FID'],
      kodeProvi: json['Kode_Provi'],
      provinsi: json['Provinsi'],
      kasusPosi: json['Kasus_Posi'],
      kasusSemb: json['Kasus_Semb'],
      kasusMeni: json['Kasus_Meni'],
    );
  }
}
