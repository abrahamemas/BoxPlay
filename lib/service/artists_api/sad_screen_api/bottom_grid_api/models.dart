class ArtistType {
  final int id;
  final String name;
  final String link;
  final String picture;
  final String picture_small;
  final String picture_medium;
  final String picture_big;
  final String picture_xl;
  final String tracklist;
  final String type;
  final int nb_album;
  final int nb_fan;

  ArtistType({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.picture_big,
    required this.picture_medium,
    required this.picture_small,
    required this.picture_xl,
    required this.tracklist,
    required this.type,
    required this.nb_album,
    required this.nb_fan,
  });

  factory ArtistType.fromJson(Map<String, dynamic> json) {
    return ArtistType(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      link: json['link'] ?? '',
      picture: json['picture'] ?? '',
      picture_small: json['picture_small'] ?? '',
      picture_medium: json['picture_medium'] ?? '',
      picture_big: json['picture_big'] ?? '',
      picture_xl: json['picture_xl'] ?? '',
      tracklist: json['tracklist'] ?? '',
      type: json['type'] ?? '',
      nb_album: json['nb_album'] ?? 0,
      nb_fan: json['nb_fan'] ?? 0,
    );
  }
}

class Album {
  final int id;
  final String title;
  final String cover;
  final String cover_medium;
  final String cover_small;
  final String cover_big;
  final String cover_xl;
  final String md5_image;
  final String tracklist;
  final String type;

  Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.cover_big,
    required this.cover_medium,
    required this.cover_small,
    required this.cover_xl,
    required this.md5_image,
    required this.tracklist,
    required this.type,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      cover: json['cover'] ?? '',
      cover_big: json['cover_big'] ?? '',
      cover_medium: json['cover_medium'] ?? '',
      cover_small: json['cover_small'] ?? '',
      cover_xl: json['cover_xl'] ?? '',
      md5_image: json['md5_image'] ?? '',
      tracklist: json['tracklist'] ?? '',
      type: json['type'] ?? '',
    );
  }
}

class PlayListItemType {
  final int id;
  final bool readable;
  final String title;
  final String title_short;
  final String title_version;
  final String link;
  final int duration;
  final int rack;
  final bool explicit_lyrics;
  final int explicit_content_cover;
  final String preview;
  final String md5_image;
  final ArtistType artist;
  final Album album;
  final String type;

  PlayListItemType({
    required this.id,
    required this.readable,
    required this.title,
    required this.title_short,
    required this.title_version,
    required this.link,
    required this.duration,
    required this.rack,
    required this.explicit_content_cover,
    required this.explicit_lyrics,
    required this.preview,
    required this.md5_image,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory PlayListItemType.fromJson(Map<String, dynamic> json) {
    return PlayListItemType(
      id: json['id'] ?? 0,
      readable: json['readable'] ?? false,
      title: json['title'] ?? '',
      title_short: json['title_short'] ?? '',
      title_version: json['title_version'] ?? '',
      link: json['link'] ?? '',
      duration: json['duration'] ?? 0,
      rack: json['rack'] ?? 0,
      explicit_lyrics: json['explicit_lyrics'] ?? false,
      explicit_content_cover: json['explicit_content_cover'] ?? 0,
      preview: json['preview'] ?? '',
      md5_image: json['md5_image'] ?? '',
      artist: ArtistType.fromJson(json['artist'] ?? {}),
      album: Album.fromJson(json['album'] ?? {}),
      type: json['type'] ?? '',
    );
  }
}

class Track {
  final PlayListItemType data;

  Track({
    required this.data,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      data: PlayListItemType.fromJson(json),
    );
  }
}

class PlaylistType {
  final Track tracks;

  PlaylistType({
    required this.tracks,
  });
  factory PlaylistType.fromJson(Map<String, dynamic> json) {
    return PlaylistType(
      tracks: Track.fromJson(json),
    );
  }
}
