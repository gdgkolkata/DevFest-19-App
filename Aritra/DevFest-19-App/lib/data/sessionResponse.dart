import 'package:devfest19/data/session.dart';

class SessionResponse {
  List<Session> sessionsList;

  SessionResponse({this.sessionsList});

factory SessionResponse.fromJson(Map<String, dynamic> json){

  var list = json['sessions'] as List;
  List<Session> sessions = list.map((i) => Session.fromJson(i)).toList();

  return SessionResponse(
    sessionsList: sessions);
  }
}