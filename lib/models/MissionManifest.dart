class MissionManifest {
  final PhotoManifest photoManifest;

  MissionManifest({required this.photoManifest});

  factory MissionManifest.fromJson(Map<String, dynamic> json) {
    return MissionManifest(
      photoManifest: PhotoManifest.fromJson(json['photo_manifest']),
    );
  }
}

class PhotoManifest {
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;
  final int maxSol;
  final String maxDate;
  final int totalPhotos;
  final List<SolInfo> photos;

  PhotoManifest({
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.photos,
  });

  factory PhotoManifest.fromJson(Map<String, dynamic> json) {
    var photosList = json['photos'] as List;
    List<SolInfo> photos = photosList.map((i) => SolInfo.fromJson(i)).toList();

    return PhotoManifest(
      name: json['name'],
      landingDate: json['landing_date'],
      launchDate: json['launch_date'],
      status: json['status'],
      maxSol: json['max_sol'],
      maxDate: json['max_date'],
      totalPhotos: json['total_photos'],
      photos: photos,
    );
  }
}

class SolInfo {
  final int sol;
  final String earthDate;
  final int totalPhotos;
  final List<String> cameras;

  SolInfo({
    required this.sol,
    required this.earthDate,
    required this.totalPhotos,
    required this.cameras,
  });

  factory SolInfo.fromJson(Map<String, dynamic> json) {
    return SolInfo(
      sol: json['sol'],
      earthDate: json['earth_date'],
      totalPhotos: json['total_photos'],
      cameras: List<String>.from(json['cameras']),
    );
  }
}
