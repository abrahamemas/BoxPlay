class ArtistsModel {
  final int id;
  final String picture;
  final String name;
  
  

  ArtistsModel( {
    required this.id,
    required this.picture,
    required this.name,
   
  });

  factory ArtistsModel.fromJson(Map<String, dynamic> json) {
    return ArtistsModel(

      id: json['id'],
      picture: json['cover'],
      name: json['title'],
      
    );
  }
}
