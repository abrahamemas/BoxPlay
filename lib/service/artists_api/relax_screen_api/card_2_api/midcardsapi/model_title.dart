class ModelTitle {
  final String title;

  ModelTitle({
    required this.title,
  });

  factory ModelTitle.fromJson(Map<String, dynamic> json) {
    return ModelTitle(
      title: json['title'],
    );
  }
}