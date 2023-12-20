class Model2 {
  final int id;
  final String picture;

  Model2( {
    required this.id,
    required this.picture,
    r
  });
  factory Model2.fromJson(Map<String, dynamic> json) {
    return Model2(
      id: json['id'],
      picture: json['cover'],
      
      
    );
  }
}
