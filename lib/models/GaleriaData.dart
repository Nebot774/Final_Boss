
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
  final List<String>? imageLinks; // Nuevo campo para los enlaces de las imágenes

  ItemData({
    this.center,
    this.dateCreated,
    this.description,
    this.mediaType,
    this.nasaId,
    this.title,
    this.keywords,
    this.imageLinks, // Incluye el nuevo campo en el constructor
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    var itemData = json['data'][0];
    var imageLinks = json['imageLinks'] != null ? List<String>.from(json['imageLinks']) : null; // Procesa el nuevo campo

    // Filtra la lista para obtener la URL que termina en small.jpg
    var smallImageUrl = imageLinks != null ? imageLinks.firstWhere((link) => link.endsWith('small.jpg')) : null;

    print('smallImageUrl: $smallImageUrl'); // Imprime el enlace de la imagen pequeña en la consola

    return ItemData(
      center: itemData['center'],
      dateCreated: itemData['dateCreated'],
      description: itemData['description'],
      mediaType: itemData['mediaType'],
      nasaId: itemData['nasaId'],
      title: itemData['title'],
      keywords: itemData['keywords'] != null ? List<String>.from(itemData['keywords']) : null,
      imageLinks: imageLinks, // Asigna el nuevo campo
    );
  }


}