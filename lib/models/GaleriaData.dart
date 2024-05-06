
class GaleriaData {
  final String? center;
  final String? dateCreated;
  final String? description;
  final String? mediaType;
  final String? nasaId;
  final String? title;
  final List<String>? keywords;
  final String? smallImageUrl;

  GaleriaData({
    this.center,
    this.dateCreated,
    this.description,
    this.mediaType,
    this.nasaId,
    this.title,
    this.keywords,
    this.smallImageUrl,
  });

  factory GaleriaData.fromJson(Map<String, dynamic> json) {
    var itemData = json['collection']['items'][0]['data'][0];
    return GaleriaData(
      center: itemData['center'],
      dateCreated: itemData['dateCreated'],
      description: itemData['description'],
      mediaType: itemData['mediaType'],
      nasaId: itemData['nasaId'],
      title: itemData['title'],
      keywords: itemData['keywords'] != null ? List<String>.from(itemData['keywords']) : null,
      smallImageUrl: json['collection']['items'][0]['links'][0]['href'],
    );
  }



}