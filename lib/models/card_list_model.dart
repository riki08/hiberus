class CardsModel {
  final List<Card1>? cards;

  CardsModel({
    this.cards,
  });

  factory CardsModel.fromMap(Map<String, dynamic> json) => CardsModel(
        cards: json["cards"] == null ? [] : List<Card1>.from(json["cards"]!.map((x) => Card1.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toMap())),
      };
}

class Card1 {
  final String? name;
  final String? manaCost;
  final double? cmc;
  final List<Color>? colors;
  final List<Color>? colorIdentity;
  final String? type;
  final List<Type>? types;
  final List<String>? subtypes;
  final Rarity? rarity;
  final Set? cardSet;
  final SetName? setName;
  final String? text;
  final String? artist;
  final String? number;
  final String? power;
  final String? toughness;
  final Layout? layout;
  final String? multiverseid;
  final String? imageUrl;
  final List<String>? variations;
  final List<ForeignName>? foreignNames;
  final List<String>? printings;
  final String? originalText;
  final String? originalType;
  final List<LegalityElement>? legalities;
  final String? id;
  final String? flavor;
  final List<Ruling>? rulings;
  final List<String>? supertypes;

  Card1({
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
    this.flavor,
    this.rulings,
    this.supertypes,
  });

  factory Card1.fromMap(Map<String, dynamic> json) => Card1(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"],
        colors: json["colors"] == null ? [] : List<Color>.from(json["colors"]!.map((x) => colorValues.map[x]!)),
        colorIdentity: json["colorIdentity"] == null
            ? []
            : List<Color>.from(json["colorIdentity"]!.map((x) => colorValues.map[x]!)),
        type: json["type"],
        types: json["types"] == null ? [] : List<Type>.from(json["types"]!.map((x) => typeValues.map[x]!)),
        subtypes: json["subtypes"] == null ? [] : List<String>.from(json["subtypes"]!.map((x) => x)),
        rarity: rarityValues.map[json["rarity"]]!,
        cardSet: setValues.map[json["set"]]!,
        setName: setNameValues.map[json["setName"]]!,
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        layout: layoutValues.map[json["layout"]]!,
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"] ?? '',
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
        flavor: json["flavor"],
        rulings: json["rulings"] == null ? [] : List<Ruling>.from(json["rulings"]!.map((x) => Ruling.fromMap(x))),
        supertypes: json["supertypes"] == null ? [] : List<String>.from(json["supertypes"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "manaCost": manaCost,
        "cmc": cmc,
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => colorValues.reverse[x])),
        "colorIdentity":
            colorIdentity == null ? [] : List<dynamic>.from(colorIdentity!.map((x) => colorValues.reverse[x])),
        "type": type,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => typeValues.reverse[x])),
        "subtypes": subtypes == null ? [] : List<dynamic>.from(subtypes!.map((x) => x)),
        "rarity": rarityValues.reverse[rarity],
        "set": setValues.reverse[cardSet],
        "setName": setNameValues.reverse[setName],
        "text": text,
        "artist": artist,
        "number": number,
        "power": power,
        "toughness": toughness,
        "layout": layoutValues.reverse[layout],
        "multiverseid": multiverseid,
        "imageUrl": imageUrl,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
        "foreignNames": foreignNames == null ? [] : List<dynamic>.from(foreignNames!.map((x) => x.toMap())),
        "printings": printings == null ? [] : List<dynamic>.from(printings!.map((x) => x)),
        "originalText": originalText,
        "originalType": originalType,
        "legalities": legalities == null ? [] : List<dynamic>.from(legalities!.map((x) => x.toMap())),
        "id": id,
        "flavor": flavor,
        "rulings": rulings == null ? [] : List<dynamic>.from(rulings!.map((x) => x.toMap())),
        "supertypes": supertypes == null ? [] : List<dynamic>.from(supertypes!.map((x) => x)),
      };
}

enum Set { THE_10_E }

final setValues = EnumValues({"10E": Set.THE_10_E});

enum Color { U, W }

final colorValues = EnumValues({"U": Color.U, "W": Color.W});

class ForeignName {
  final String? name;
  final String? text;
  final String? type;
  final String? flavor;
  final String? imageUrl;
  final Language? language;
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
        language: languageValues.map[json["language"]]!,
        identifiers: json["identifiers"] == null ? null : Identifiers.fromMap(json["identifiers"]),
        multiverseid: json["multiverseid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "text": text,
        "type": type,
        "flavor": flavor,
        "imageUrl": imageUrl,
        "language": languageValues.reverse[language],
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

enum Language { CHINESE_SIMPLIFIED, FRENCH, GERMAN, ITALIAN, JAPANESE, PORTUGUESE_BRAZIL, RUSSIAN, SPANISH }

final languageValues = EnumValues({
  "Chinese Simplified": Language.CHINESE_SIMPLIFIED,
  "French": Language.FRENCH,
  "German": Language.GERMAN,
  "Italian": Language.ITALIAN,
  "Japanese": Language.JAPANESE,
  "Portuguese (Brazil)": Language.PORTUGUESE_BRAZIL,
  "Russian": Language.RUSSIAN,
  "Spanish": Language.SPANISH
});

enum Layout { NORMAL }

final layoutValues = EnumValues({"normal": Layout.NORMAL});

class LegalityElement {
  final Format? format;
  final LegalityEnum? legality;

  LegalityElement({
    this.format,
    this.legality,
  });

  factory LegalityElement.fromMap(Map<String, dynamic> json) => LegalityElement(
        format: formatValues.map[json["format"]]!,
        legality: legalityEnumValues.map[json["legality"]]!,
      );

  Map<String, dynamic> toMap() => {
        "format": formatValues.reverse[format],
        "legality": legalityEnumValues.reverse[legality],
      };
}

enum Format {
  ALCHEMY,
  BRAWL,
  COMMANDER,
  DUEL,
  EXPLORER,
  GLADIATOR,
  HISTORIC,
  LEGACY,
  MODERN,
  OATHBREAKER,
  PAUPER,
  PAUPERCOMMANDER,
  PENNY,
  PIONEER,
  PREDH,
  PREMODERN,
  TIMELESS,
  VINTAGE
}

final formatValues = EnumValues({
  "Alchemy": Format.ALCHEMY,
  "Brawl": Format.BRAWL,
  "Commander": Format.COMMANDER,
  "Duel": Format.DUEL,
  "Explorer": Format.EXPLORER,
  "Gladiator": Format.GLADIATOR,
  "Historic": Format.HISTORIC,
  "Legacy": Format.LEGACY,
  "Modern": Format.MODERN,
  "Oathbreaker": Format.OATHBREAKER,
  "Pauper": Format.PAUPER,
  "Paupercommander": Format.PAUPERCOMMANDER,
  "Penny": Format.PENNY,
  "Pioneer": Format.PIONEER,
  "Predh": Format.PREDH,
  "Premodern": Format.PREMODERN,
  "Timeless": Format.TIMELESS,
  "Vintage": Format.VINTAGE
});

enum LegalityEnum { LEGAL, RESTRICTED }

final legalityEnumValues = EnumValues({"Legal": LegalityEnum.LEGAL, "Restricted": LegalityEnum.RESTRICTED});

enum Rarity { COMMON, RARE, UNCOMMON }

final rarityValues = EnumValues({"Common": Rarity.COMMON, "Rare": Rarity.RARE, "Uncommon": Rarity.UNCOMMON});

class Ruling {
  final DateTime? date;
  final String? text;

  Ruling({
    this.date,
    this.text,
  });

  factory Ruling.fromMap(Map<String, dynamic> json) => Ruling(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "text": text,
      };
}

enum SetName { TENTH_EDITION }

final setNameValues = EnumValues({"Tenth Edition": SetName.TENTH_EDITION});

enum Type { CREATURE, ENCHANTMENT, INSTANT, SORCERY }

final typeValues = EnumValues(
    {"Creature": Type.CREATURE, "Enchantment": Type.ENCHANTMENT, "Instant": Type.INSTANT, "Sorcery": Type.SORCERY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
