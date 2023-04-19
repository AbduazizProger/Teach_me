class Video {
  final String title;
  final List<String> urls;
  final List<String> names;

  Video({required this.title, required this.urls, required this.names});

  factory Video.fromJson(Map<String, dynamic> json) {
    List<String> urls = [
      json['video1'],
      json['video2'],
      json['video3'],
      json['video4']
    ];
    List<String> names = [
      json['title1'],
      json['title2'],
      json['title3'],
      json['title4']
    ];
    return Video(title: json['title'] as String, urls: urls, names: names);
  }
}
