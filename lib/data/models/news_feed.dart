class NewsFeed {
  NewsFeed({
    required this.id,
    required this.title,
    required this.type,
    required this.thumbnail,
    required this.status,
    // required this.body,
    required this.time,
  });

  String id;
  String title;
  String type;
  String thumbnail;
  String status;
  // Body body;
  DateTime time;

  factory NewsFeed.fromJson(Map<String, dynamic> json) => NewsFeed(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        // body: Body.fromJson(json["body"]),
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "thumbnail": thumbnail,
        "status": status,
        // "body": body.toJson(),
        "time": time.toIso8601String(),
      };
}
