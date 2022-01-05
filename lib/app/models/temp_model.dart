class TempModel {
  String? name;
  String? temp;
  int? id;
  String? date;
  String? time;
  String? mode;
  bool? hold;
  TempModel(
      {this.name,
      this.temp,
      this.id,
      this.date,
      this.time,
      this.mode,
      this.hold});
  factory TempModel.fromJson(Map<String, dynamic> json) {
    return TempModel(
      name: json['name'],
      temp: json['temp'],
      id: json['id'],
      date: json['date'],
      time: json['time'],
      mode: json['mode'],
      hold: json['hold'],
    );
  }
}
