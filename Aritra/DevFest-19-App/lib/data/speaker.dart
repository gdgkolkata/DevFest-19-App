class Speaker {
  String fullName, bio, tagLine, profilePicture;

  Speaker({this.fullName, this.bio, this.tagLine, this.profilePicture});

  factory Speaker.fromJson(Map<String, dynamic> json) {
    return Speaker(
      fullName: json['fullName'],
      bio: json['bio'],
      tagLine: json['tagLine'],
      profilePicture: json['profilePicture'],

    );
  } 
}