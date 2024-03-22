import 'dart:convert';

LocationsResponse locationsFromJson(String str) => LocationsResponse.fromJson(json.decode(str));

String locationsToJson(LocationsResponse data) => json.encode(data.toJson());

class LocationsResponse {
    LocationsResponse({
        required this.info,
        required this.results,
    });

    InfoLocationsResponse info;
    List<Location> results;

    factory LocationsResponse.fromJson(Map<String, dynamic> json) => LocationsResponse(
        info: InfoLocationsResponse.fromJson(json["info"]),
        results: List<Location>.from(json["results"].map((x) => Location.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class InfoLocationsResponse {
    InfoLocationsResponse({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
    });

    int count;
    int pages;
    dynamic next;
    dynamic prev;

    factory InfoLocationsResponse.fromJson(Map<String, dynamic> json) => InfoLocationsResponse(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class Location {
    Location({
        required this.id,
        required this.name,
        required this.type,
        required this.dimension,
        required this.residents,
        required this.url,
        required this.created,
    });

    int id;
    String name;
    String type;
    String dimension;
    List<String> residents;
    String url;
    DateTime created;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}
