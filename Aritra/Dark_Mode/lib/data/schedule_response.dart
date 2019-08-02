class ScheduleResponse {
  int state;

  ScheduleResponse({this.state});

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleResponse(state: json['state']);
  }
}