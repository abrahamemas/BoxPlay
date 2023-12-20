class Model {
  final int id;
  final String picture;

  Model( {
    required this.id,
    required this.picture,
    r
  });
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      picture: json['cover'],
      
      
    );
  }
}
