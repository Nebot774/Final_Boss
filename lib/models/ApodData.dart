

class ApodData {
  final String? date;
  final String? explanation;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;
  final String? copyright;

  ApodData({
    this.date,
    this.explanation,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
    this.copyright,
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