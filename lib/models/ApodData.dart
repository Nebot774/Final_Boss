

class ApodData {
  final String date;
  final String explanation;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;
  final String copyright;

  ApodData({
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
    required this.copyright,
  });

  factory ApodData.fromJson(Map<String, dynamic> json) {
    return ApodData(
      date: json['date'],
      explanation: json['explanation'],
      mediaType: json['mediaType'],
      serviceVersion: json['serviceVersion'],
      title: json['title'],
      url: json['url'],
      copyright: json['copyright'],
    );
  }
}