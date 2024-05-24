class TierraDesdeEspacio {
  final String date;
  final String url;

  TierraDesdeEspacio({required this.date, required this.url});

  factory TierraDesdeEspacio.fromJson(Map<String, dynamic> json) {
    return TierraDesdeEspacio(
      date: json['date'],
      url: json['url'],
    );
  }
}