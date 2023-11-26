class Game {
  final List<Amiibo>? amiibo;

  Game({
    this.amiibo,
  });

  Game.fromJson(Map<String, dynamic> json)
    : amiibo = (json['amiibo'] as List?)?.map((dynamic e) => Amiibo.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'amiibo' : amiibo?.map((e) => e.toJson()).toList()
  };
}

class Amiibo {
  final String? amiiboSeries;
  final String? character;
  final String? gameSeries;
  final String? head;
  final String? image;
  final String? name;
  final Release? release;
  final String? tail;
  final String? type;

  Amiibo({
    this.amiiboSeries,
    this.character,
    this.gameSeries,
    this.head,
    this.image,
    this.name,
    this.release,
    this.tail,
    this.type,
  });

  Amiibo.fromJson(Map<String, dynamic> json)
    : amiiboSeries = json['amiiboSeries'] as String?,
      character = json['character'] as String?,
      gameSeries = json['gameSeries'] as String?,
      head = json['head'] as String?,
      image = json['image'] as String?,
      name = json['name'] as String?,
      release = (json['release'] as Map<String,dynamic>?) != null ? Release.fromJson(json['release'] as Map<String,dynamic>) : null,
      tail = json['tail'] as String?,
      type = json['type'] as String?;

  Map<String, dynamic> toJson() => {
    'amiiboSeries' : amiiboSeries,
    'character' : character,
    'gameSeries' : gameSeries,
    'head' : head,
    'image' : image,
    'name' : name,
    'release' : release?.toJson(),
    'tail' : tail,
    'type' : type
  };
}

class Release {
  final String? au;
  final String? eu;
  final String? jp;
  final String? na;

  Release({
    this.au,
    this.eu,
    this.jp,
    this.na,
  });

  Release.fromJson(Map<String, dynamic> json)
    : au = json['au'] as String?,
      eu = json['eu'] as String?,
      jp = json['jp'] as String?,
      na = json['na'] as String?;

  Map<String, dynamic> toJson() => {
    'au' : au,
    'eu' : eu,
    'jp' : jp,
    'na' : na
  };
}