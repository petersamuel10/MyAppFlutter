class SliderImage {
  final String photosId;
  final String photosPath;

  SliderImage({this.photosId, this.photosPath});

  factory SliderImage.fromJson(Map<String, dynamic> json) {
    return SliderImage(
      photosId: json['photos_id'],
      photosPath: json['photos_path'],
    );
  }
}
