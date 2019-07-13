class Speaker {
  String fullName, bio, tagLine, profilePicture;
  List links;

  Speaker({this.fullName, this.bio, this.tagLine, this.profilePicture, this.links});

  factory Speaker.fromJson(Map<String, dynamic> json) {

    var list = json['links'] as List;
    List<Link> linksList = list.map((i) => Link.fromJson(i)).toList();
    return Speaker(
      fullName: json['fullName'],
      bio: json['bio'],
      tagLine: json['tagLine'],
      profilePicture: json['profilePicture'],
      links: linksList
    );
  } 
}

class Link {
  String title, link, linkType;
  Link({this.title, this.link, this.linkType});
  factory Link.fromJson(Map<String, dynamic> json) {
    return Link (
      title: json['title'],
      link: json['url'],
      linkType: json['linkType']
    );
  }
}