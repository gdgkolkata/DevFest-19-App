class Sponsor {
  String name, url, logo;

  Sponsor({this.name, this.url, this.logo});

  factory Sponsor.fromJson(Map<String, dynamic> json){
  return Sponsor(
    name: json['name'],
    url: json['url'],
    logo: json['logo']
  );
  }
}