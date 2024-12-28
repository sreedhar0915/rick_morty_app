// To parse this JSON data, do
//
//     final characterscreenmodel = characterscreenmodelFromJson(jsonString);

import 'dart:convert';

Characterscreenmodel characterscreenmodelFromJson(String str) =>
    Characterscreenmodel.fromJson(json.decode(str));

String characterscreenmodelToJson(Characterscreenmodel data) =>
    json.encode(data.toJson());

class Characterscreenmodel {
  Data? data;

  Characterscreenmodel({
    this.data,
  });

  factory Characterscreenmodel.fromJson(Map<String, dynamic> json) =>
      Characterscreenmodel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Characters? characters;
  Location? location;
  List<Location>? episodesByIds;

  Data({
    this.characters,
    this.location,
    this.episodesByIds,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characters: json["characters"] == null
            ? null
            : Characters.fromJson(json["characters"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        episodesByIds: json["episodesByIds"] == null
            ? []
            : List<Location>.from(
                json["episodesByIds"]!.map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters?.toJson(),
        "location": location?.toJson(),
        "episodesByIds": episodesByIds == null
            ? []
            : List<dynamic>.from(episodesByIds!.map((x) => x.toJson())),
      };
}

class Characters {
  Info? info;
  List<Result>? results;

  Characters({
    this.info,
    this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Info {
  int? count;

  Info({
    this.count,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class Result {
  String? id;
  String? name;
  Status? status;
  Gender? gender;
  String? image;
  Species? species;

  Result({
    this.id,
    this.name,
    this.status,
    this.gender,
    this.image,
    this.species,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        gender: genderValues.map[json["gender"]]!,
        image: json["image"],
        species: speciesValues.map[json["species"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "gender": genderValues.reverse[gender],
        "image": image,
        "species": speciesValues.reverse[species],
      };
}

enum Gender { MALE }

final genderValues = EnumValues({"Male": Gender.MALE});

enum Species { HUMAN, ROBOT, UNKNOWN }

final speciesValues = EnumValues({
  "Human": Species.HUMAN,
  "Robot": Species.ROBOT,
  "unknown": Species.UNKNOWN
});

enum Status { ALIVE, DEAD, UNKNOWN }

final statusValues = EnumValues(
    {"Alive": Status.ALIVE, "Dead": Status.DEAD, "unknown": Status.UNKNOWN});

class Location {
  String? id;

  Location({
    this.id,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
