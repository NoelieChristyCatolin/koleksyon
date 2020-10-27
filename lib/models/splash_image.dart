class SplashImage{
  final String id;
  final String description;
  final String url;
  final int likes;

  SplashImage({this.id, this.description, this.url, this.likes});

  factory SplashImage.fromJson(Map<String, dynamic> json){
    print('${json['id']}:${json['urls']['raw']}');
    return SplashImage(id: json['id'], description: json['description'] ?? '', url: json['urls']['small'], likes: json['likes']);

  }

}