class RaceModel {
  String? name;
  String? organizer;
  String? date;
  String? country;
  String? city;
  String? image;
  String? type;
  String? distances;

  RaceModel(
      {this.name,
      this.organizer,
      this.date,
      this.country,
      this.city,
      this.image,
      this.type,
      this.distances});

  RaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    organizer = json['organizer'];
    date = json['date'];
    country = json['country'];
    city = json['city'];
    image = json['image'];
    type = json['type'];
    distances = json['distances'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['organizer'] = organizer;
    data['date'] = date;
    data['country'] = country;
    data['city'] = city;
    data['image'] = image;
    data['type'] = type;
    data['distances'] = distances;
    return data;
  }
}
