class ImageModel {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  ImageModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id']?.toString() ?? '',
      author: json['author'] ?? '',
      width: (json['width'] is int) ? json['width'] : int.tryParse('${json['width']}') ?? 0,
      height: (json['height'] is int) ? json['height'] : int.tryParse('${json['height']}') ?? 0,
      url: json['url'] ?? '',
      downloadUrl: json['download_url'] ?? json['downloadUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'width': width,
        'height': height,
        'url': url,
        'download_url': downloadUrl,
      };
}

