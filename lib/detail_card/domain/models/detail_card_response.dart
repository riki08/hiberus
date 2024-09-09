class DetailCarResponse {
  final CardResponse? card;

  DetailCarResponse({
    this.card,
  });

  factory DetailCarResponse.fromMap(Map<String, dynamic> json) => DetailCarResponse(
        card: json["card"] == null ? null : CardResponse.fromMap(json["card"]),
      );

  Map<String, dynamic> toMap() => {
        "card": card?.toMap(),
      };
}

class CardResponse {
  final String? name;
  final String? manaCost;
  final double? cmc;
  final List<String>? colors;
  final List<String>? colorIdentity;
  final String? type;
  final List<String>? types;
  final List<String>? subtypes;
  final String? rarity;
  final String? cardSet;
  final String? setName;
  final String? text;
  final String? artist;
  final String? number;
  final String? power;
  final String? toughness;
  final String? layout;
  final String? multiverseid;
  final String? imageUrl;
  final List<String>? variations;
  final List<ForeignName>? foreignNames;
  final List<String>? printings;
  final String? originalText;
  final String? originalType;
  final List<LegalityElement>? legalities;
  final String? id;

  CardResponse({
    this.name,
    this.manaCost,
    this.cmc,
    this.colors,
    this.colorIdentity,
    this.type,
    this.types,
    this.subtypes,
    this.rarity,
    this.cardSet,
    this.setName,
    this.text,
    this.artist,
    this.number,
    this.power,
    this.toughness,
    this.layout,
    this.multiverseid,
    this.imageUrl,
    this.variations,
    this.foreignNames,
    this.printings,
    this.originalText,
    this.originalType,
    this.legalities,
    this.id,
  });

  factory CardResponse.fromMap(Map<String, dynamic> json) => CardResponse(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"],
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        colorIdentity: json["colorIdentity"] == null ? [] : List<String>.from(json["colorIdentity"]!.map((x) => x)),
        type: json["type"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
        subtypes: json["subtypes"] == null ? [] : List<String>.from(json["subtypes"]!.map((x) => x)),
        rarity: json["rarity"],
        cardSet: json["set"],
        setName: json["setName"],
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        layout: json["layout"],
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"] ?? "",
        variations: json["variations"] == null ? [] : List<String>.from(json["variations"]!.map((x) => x)),
        foreignNames: json["foreignNames"] == null
            ? []
            : List<ForeignName>.from(json["foreignNames"]!.map((x) => ForeignName.fromMap(x))),
        printings: json["printings"] == null ? [] : List<String>.from(json["printings"]!.map((x) => x)),
        originalText: json["originalText"],
        originalType: json["originalType"],
        legalities: json["legalities"] == null
            ? []
            : List<LegalityElement>.from(json["legalities"]!.map((x) => LegalityElement.fromMap(x))),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "manaCost": manaCost,
        "cmc": cmc,
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "colorIdentity": colorIdentity == null ? [] : List<dynamic>.from(colorIdentity!.map((x) => x)),
        "type": type,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "subtypes": subtypes == null ? [] : List<dynamic>.from(subtypes!.map((x) => x)),
        "rarity": rarity,
        "set": cardSet,
        "setName": setName,
        "text": text,
        "artist": artist,
        "number": number,
        "power": power,
        "toughness": toughness,
        "layout": layout,
        "multiverseid": multiverseid,
        "imageUrl": imageUrl,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
        "foreignNames": foreignNames == null ? [] : List<dynamic>.from(foreignNames!.map((x) => x.toMap())),
        "printings": printings == null ? [] : List<dynamic>.from(printings!.map((x) => x)),
        "originalText": originalText,
        "originalType": originalType,
        "legalities": legalities == null ? [] : List<dynamic>.from(legalities!.map((x) => x.toMap())),
        "id": id,
      };
}

class ForeignName {
  final String? name;
  final String? text;
  final String? type;
  final String? flavor;
  final String? imageUrl;
  final String? language;
  final Identifiers? identifiers;
  final int? multiverseid;

  ForeignName({
    this.name,
    this.text,
    this.type,
    this.flavor,
    this.imageUrl,
    this.language,
    this.identifiers,
    this.multiverseid,
  });

  factory ForeignName.fromMap(Map<String, dynamic> json) => ForeignName(
        name: json["name"],
        text: json["text"],
        type: json["type"],
        flavor: json["flavor"],
        imageUrl: json["imageUrl"],
        language: json["language"],
        identifiers: json["identifiers"] == null ? null : Identifiers.fromMap(json["identifiers"]),
        multiverseid: json["multiverseid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "text": text,
        "type": type,
        "flavor": flavor,
        "imageUrl": imageUrl,
        "language": language,
        "identifiers": identifiers?.toMap(),
        "multiverseid": multiverseid,
      };
}

class Identifiers {
  final String? scryfallId;
  final int? multiverseId;

  Identifiers({
    this.scryfallId,
    this.multiverseId,
  });

  factory Identifiers.fromMap(Map<String, dynamic> json) => Identifiers(
        scryfallId: json["scryfallId"],
        multiverseId: json["multiverseId"],
      );

  Map<String, dynamic> toMap() => {
        "scryfallId": scryfallId,
        "multiverseId": multiverseId,
      };
}

class LegalityElement {
  final String? format;
  final LegalityEnum? legality;

  LegalityElement({
    this.format,
    this.legality,
  });

  factory LegalityElement.fromMap(Map<String, dynamic> json) => LegalityElement(
        format: json["format"],
        legality: legalityEnumValues.map[json["legality"]]!,
      );

  Map<String, dynamic> toMap() => {
        "format": format,
        "legality": legalityEnumValues.reverse[legality],
      };
}

enum LegalityEnum { LEGAL, RESTRICTED }

final legalityEnumValues = EnumValues({"Legal": LegalityEnum.LEGAL, "Restricted": LegalityEnum.RESTRICTED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
