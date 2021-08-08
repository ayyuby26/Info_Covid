class NationalModel {
  String? name;
  String? positif;
  String? sembuh;
  String? meninggal;
  String? dirawat;

  NationalModel({
    this.name,
    this.positif,
    this.sembuh,
    this.meninggal,
    this.dirawat,
  });

  factory NationalModel.fromJson(Map<String, dynamic> json) {
    return NationalModel(
      name: json['name'],
      positif: json['positif'],
      sembuh: json['sembuh'],
      meninggal: json['meninggal'],
      dirawat: json['dirawat'],
    );
  }
}
