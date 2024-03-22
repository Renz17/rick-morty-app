import 'dart:convert';

CharactersResponse charactersFromJson(String str) => CharactersResponse.fromJson(json.decode(str));

String charactersToJson(CharactersResponse data) => json.encode(data.toJson());

class CharactersResponse {
    CharactersResponse({
        required this.info,
        required this.results,
    });

    InfoCharacterResponse info;
    List<Character> results;

    factory CharactersResponse.fromJson(Map<String, dynamic> json) => CharactersResponse(
        info: InfoCharacterResponse.fromJson(json["info"]),
        results: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class InfoCharacterResponse {
    InfoCharacterResponse({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
    });

    int count;
    int pages;
    dynamic next;
    dynamic prev;

    factory InfoCharacterResponse.fromJson(Map<String, dynamic> json) => InfoCharacterResponse(
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

class Character {
    Character({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    LocationCharacters origin;
    LocationCharacters location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: LocationCharacters.fromJson(json["origin"]),
        location: LocationCharacters.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

class LocationCharacters {
    LocationCharacters({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory LocationCharacters.fromJson(Map<String, dynamic> json) => LocationCharacters(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}