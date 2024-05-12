import 'dart:convert';

class NeoWsData {
  final String? id;
  final String? name;
  final Links? links;
  final int? elementCount;
  final Map<String, List<NearEarthObject>>? nearEarthObjects;

  NeoWsData({
    this.id,
    this.name,
    this.links,
    this.elementCount,
    this.nearEarthObjects,
  });

  factory NeoWsData.fromJson(Map<String, dynamic> json) {
    return NeoWsData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      elementCount: json['element_count'] as int?,
      nearEarthObjects: json['near_earth_objects'] != null
          ? (json['near_earth_objects'] as Map).map(
            (key, value) => MapEntry(
            key as String,
            List<NearEarthObject>.from(
                value.map((x) => NearEarthObject.fromJson(x)))),
      )
          : null,
    );
  }
}

class Links {
  final String? next;
  final String? prev;
  final String? self;

  Links({this.next, this.prev, this.self});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      self: json['self'] as String?,
    );
  }
}

class NearEarthObject {
  final Links? links;
  final String? id;
  final String? neoReferenceId;
  final String? name;
  final String? nasaJplUrl;
  final double? absoluteMagnitudeH;
  final EstimatedDiameter? estimatedDiameter;
  final bool? isSentryObject;
  final bool? isPotentiallyHazardousAsteroid;
  final List<CloseApproachData>? closeApproachData;

  NearEarthObject({
    this.links,
    this.id,
    this.neoReferenceId,
    this.name,
    this.nasaJplUrl,
    this.absoluteMagnitudeH,
    this.estimatedDiameter,
    this.isSentryObject,
    this.isPotentiallyHazardousAsteroid,
    this.closeApproachData,
  });

  factory NearEarthObject.fromJson(Map<String, dynamic> json) {
    return NearEarthObject(
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      id: json['id'] as String?,
      neoReferenceId: json['neo_reference_id'] as String?,
      name: json['name'] as String?,
      nasaJplUrl: json['nasa_jpl_url'] as String?,
      absoluteMagnitudeH: (json['absolute_magnitude_h'] as num?)?.toDouble(),
      estimatedDiameter: json['estimated_diameter'] != null
          ? EstimatedDiameter.fromJson(json['estimated_diameter'])
          : null,
      isSentryObject: json['is_sentry_object'] as bool?,
      isPotentiallyHazardousAsteroid:
      json['is_potentially_hazardous_asteroid'] as bool?,
      closeApproachData: json['close_approach_data'] != null
          ? List<CloseApproachData>.from(json['close_approach_data']
          .map((x) => CloseApproachData.fromJson(x)))
          : null,
    );
  }
}

class EstimatedDiameter {
  final Diameter? kilometers;
  final Diameter? meters;
  final Diameter? miles;
  final Diameter? feet;

  EstimatedDiameter({
    this.kilometers,
    this.meters,
    this.miles,
    this.feet,
  });

  factory EstimatedDiameter.fromJson(Map<String, dynamic> json) {
    return EstimatedDiameter(
      kilometers: json['kilometers'] != null
          ? Diameter.fromJson(json['kilometers'])
          : null,
      meters: json['meters'] != null ? Diameter.fromJson(json['meters']) : null,
      miles: json['miles'] != null ? Diameter.fromJson(json['miles']) : null,
      feet: json['feet'] != null ? Diameter.fromJson(json['feet']) : null,
    );
  }
}

class Diameter {
  final double? estimatedDiameterMin;
  final double? estimatedDiameterMax;

  Diameter({this.estimatedDiameterMin, this.estimatedDiameterMax});

  factory Diameter.fromJson(Map<String, dynamic> json) {
    return Diameter(
      estimatedDiameterMin: (json['estimated_diameter_min'] as num?)?.toDouble(),
      estimatedDiameterMax: (json['estimated_diameter_max'] as num?)?.toDouble(),
    );
  }
}

class CloseApproachData {
  final String? closeApproachDate;
  final String? closeApproachDateFull;
  final int? epochDateCloseApproach;
  final RelativeVelocity? relativeVelocity;
  final MissDistance? missDistance;
  final String? orbitingBody;

  CloseApproachData({
    this.closeApproachDate,
    this.closeApproachDateFull,
    this.epochDateCloseApproach,
    this.relativeVelocity,
    this.missDistance,
    this.orbitingBody,
  });

  factory CloseApproachData.fromJson(Map<String, dynamic> json) {
    return CloseApproachData(
      closeApproachDate: json['close_approach_date'] as String?,
      closeApproachDateFull: json['close_approach_date_full'] as String?,
      epochDateCloseApproach: json['epoch_date_close_approach'] as int?,
      relativeVelocity: json['relative_velocity'] != null
          ? RelativeVelocity.fromJson(json['relative_velocity'])
          : null,
      missDistance: json['miss_distance'] != null
          ? MissDistance.fromJson(json['miss_distance'])
          : null,
      orbitingBody: json['orbiting_body'] as String?,
    );
  }
}

class RelativeVelocity {
  final double? kilometersPerSecond;
  final double? kilometersPerHour;
  final double? milesPerHour;

  RelativeVelocity({
    this.kilometersPerSecond,
    this.kilometersPerHour,
    this.milesPerHour,
  });

  factory RelativeVelocity.fromJson(Map<String, dynamic> json) {
    return RelativeVelocity(
      kilometersPerSecond: (json['kilometers_per_second'] as num?)?.toDouble(),
      kilometersPerHour: (json['kilometers_per_hour'] as num?)?.toDouble(),
      milesPerHour: (json['miles_per_hour'] as num?)?.toDouble(),
    );
  }
}

class MissDistance {
  final double? astronomical;
  final double? lunar;
  final double? kilometers;
  final double? miles;

  MissDistance({
    this.astronomical,
    this.lunar,
    this.kilometers,
    this.miles,
  });

  factory MissDistance.fromJson(Map<String, dynamic> json) {
    return MissDistance(
      astronomical: (json['astronomical'] as num?)?.toDouble(),
      lunar: (json['lunar'] as num?)?.toDouble(),
      kilometers: (json['kilometers'] as num?)?.toDouble(),
      miles: (json['miles'] as num?)?.toDouble(),
    );
  }


}

