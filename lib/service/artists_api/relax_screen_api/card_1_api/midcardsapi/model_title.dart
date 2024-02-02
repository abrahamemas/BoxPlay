class ArtistsModelTitle {
  final String title;

  ArtistsModelTitle({
    required this.title,
  });
  factory ArtistsModelTitle.fromJson(Map<String, dynamic> json) {
    return ArtistsModelTitle(
      title: json['name'] ?? '',
    );
  }
}
