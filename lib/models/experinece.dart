class Experince {
  String companyName;
  String position;
  String type;
  String firstDate;
  String lastDate;
  String duration;
  String place;
  String image;
  Experince({
    required this.companyName,
    required this.position,
    required this.type,
    required this.firstDate,
    required this.lastDate,
    required this.duration,
    required this.place,
    required this.image,
  });

  factory Experince.fromJson(Map<String, dynamic> data) => Experince(
        companyName: data['companyName'],
        position: data['position'],
        type: data['type'],
        firstDate: data['firstDate'],
        lastDate: data['lastDate'],
        duration: data['duration'],
        place: data['place'],
        image: data['image'],
      );
}
