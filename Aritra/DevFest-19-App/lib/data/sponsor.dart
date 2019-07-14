class Sponsor {
  String name, url, logo, description;

  Sponsor({this.name, this.url, this.logo, this.description});

  factory Sponsor.fromJson(Map<String, dynamic> json){
  return Sponsor(
    name: json['name'],
    url: json['url'],
    logo: json['logo'],
    description: json['description']
  );
  }
}