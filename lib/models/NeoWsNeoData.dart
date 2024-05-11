class NeoWsNeoData {
  final Links links;
  final String id;
  final String neoReferenceId;
  final String name;
  final String nasaJplUrl;
  final double absoluteMagnitudeH;
  final EstimatedDiameter estimatedDiameter;
  final bool isPotentiallyHazardousAsteroid;
  final List<CloseApproachData> closeApproachData;
  final bool isSentryObject;

  NeoWsNeoData({
    required this.links,
    required this.id,
    required this.neoReferenceId,
    required this.name,
    required this.nasaJplUrl,
    required this.absoluteMagnitudeH,
    required this.estimatedDiameter,
    required this.isPotentiallyHazardousAsteroid,
    required this.closeApproachData,
    required this.isSentryObject,
  });

  factory NeoWsNeoData.fromJson(Map<String, dynamic> json) {
    return NeoWsNeoData(
      links: Links.fromJson(json['links']),
      id: json['id'],
      neoReferenceId: json['neo_reference_id'],
      name: json['name'],
      nasaJplUrl: json['nasa_jpl_url'],
      absoluteMagnitudeH: json['absolute_magnitude_h'].toDouble(),
      estimatedDiameter: EstimatedDiameter.fromJson(json['estimated_diameter']),
      isPotentiallyHazardousAsteroid: json['is_potentially_hazardous_asteroid'],
      closeApproachData: List<CloseApproachData>.from(json['close_approach_data'].map((x) => CloseApproachData.fromJson(x))),
      isSentryObject: json['is_sentry_object'],
    );
  }
}

class Links {
  final String self;

  Links({required this.self});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'],
    );
  }
}

class EstimatedDiameter {
  final Diameter kilometers;
  final Diameter meters;
  final Diameter miles;
  final Diameter feet;

  EstimatedDiameter({
    required this.kilometers,
    required this.meters,
    required this.miles,
    required this.feet,
  });

  factory EstimatedDiameter.fromJson(Map<String, dynamic> json) {
    return EstimatedDiameter(
      kilometers: Diameter.fromJson(json['kilometers']),
      meters: Diameter.fromJson(json['meters']),
      miles: Diameter.fromJson(json['miles']),
      feet: Diameter.fromJson(json['feet']),
    );
  }
}

class Diameter {
  final double estimatedDiameterMin;
  final double estimatedDiameterMax;

  Diameter({required this.estimatedDiameterMin, required this.estimatedDiameterMax});

  factory Diameter.fromJson(Map<String, dynamic> json) {
    return Diameter(
      estimatedDiameterMin: json['estimated_diameter_min'].toDouble(),
      estimatedDiameterMax: json['estimated_diameter_max'].toDouble(),
    );
  }
}

class CloseApproachData {
  final String closeApproachDate;
  final String closeApproachDateFull;
  final int epochDateCloseApproach;
  final RelativeVelocity relativeVelocity;
  final MissDistance missDistance;
  final String orbitingBody;

  CloseApproachData({
    required this.closeApproachDate,
    required this.closeApproachDateFull,
    required this.epochDateCloseApproach,
    required this.relativeVelocity,
    required this.missDistance,
    required this.orbitingBody,
  });

  factory CloseApproachData.fromJson(Map<String, dynamic> json) {
    return CloseApproachData(
      closeApproachDate: json['close_approach_date'],
      closeApproachDateFull: json['close_approach_date_full'],
      epochDateCloseApproach: json['epoch_date_close_approach'],
      relativeVelocity: RelativeVelocity.fromJson(json['relative_velocity']),
      missDistance: MissDistance.fromJson(json['miss_distance']),
      orbitingBody: json['orbiting_body'],
    );
  }
}

class RelativeVelocity {
  final double kilometersPerSecond;
  final double kilometersPerHour;
  final double milesPerHour;

  RelativeVelocity({
    required this.kilometersPerSecond,
    required this.kilometersPerHour,
    required this.milesPerHour,
  });

  factory RelativeVelocity.fromJson(Map<String, dynamic> json) {
    return RelativeVelocity(
      kilometersPerSecond: json['kilometers_per_second'].toDouble(),
      kilometersPerHour: json['kilometers_per_hour'].toDouble(),
      milesPerHour: json['miles_per_hour'].toDouble(),
    );
  }
}

class MissDistance {
  final double astronomical;
  final double lunar;
  final double kilometers;
  final double miles;

  MissDistance({
    required this.astronomical,
    required this.lunar,
    required this.kilometers,
    required this.miles,
  });

  factory MissDistance.fromJson(Map<String, dynamic> json) {
    return MissDistance(
      astronomical: json['astronomical'].toDouble(),
      lunar: json['lunar'].toDouble(),
      kilometers: json['kilometers'].toDouble(),
      miles: json['miles'].toDouble(),
    );
  }
}
