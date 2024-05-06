
class GaleriaData {
  final List<ItemData> items;

  GaleriaData({required this.items});

  factory GaleriaData.fromJson(Map<String, dynamic> json) {
    var itemsJson = json['collection']['items'] as List;
    List<ItemData> itemsList = itemsJson.map((i) => ItemData.fromJson(i)).toList();

    return GaleriaData(
      items: itemsList,
    );
  }
}

class ItemData {
  final String? center;
  final String? dateCreated;
  final String? description;
  final String? mediaType;
  final String? nasaId;
  final String? title;
  final List<String>? keywords;
  final String? smallImageUrl;

  ItemData({
    this.center,
    this.dateCreated,
    this.description,
    this.mediaType,
    this.nasaId,
    this.title,
    this.keywords,
    this.smallImageUrl,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    var itemData = json['data'][0];
    var smallImageUrl = json['links'] != null && json['links'].isNotEmpty ? json['links'][0]['href'] : null;

    print('smallImageUrl: $smallImageUrl'); // Imprime el valor de smallImageUrl en la consola

    return ItemData(
      center: itemData['center'],
      dateCreated: itemData['dateCreated'],
      description: itemData['description'],
      mediaType: itemData['mediaType'],
      nasaId: itemData['nasaId'],
      title: itemData['title'],
      keywords: itemData['keywords'] != null ? List<String>.from(itemData['keywords']) : null,
      smallImageUrl: smallImageUrl,
    );
  }
}