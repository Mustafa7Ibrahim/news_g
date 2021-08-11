import 'dart:convert';

ListOfSources sourcesFromJson(String str) =>
    ListOfSources.fromJson(json.decode(str));

String sourcesToJson(Sources data) => json.encode(data.toJson());

class ListOfSources {
  String? status;
  List<Sources>? sources;

  ListOfSources({
    this.status,
    this.sources,
  });

  factory ListOfSources.fromJson(Map<String, dynamic> json) => ListOfSources(
        status: json["status"],
        sources: List<Sources>.from(
          json["sources"].map((x) => Sources.fromJson(x)),
        ),
      );
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
      };
}
