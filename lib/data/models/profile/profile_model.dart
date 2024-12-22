class Profile {
  String id;
  String name;
  String profession;
  String dob;
  String hobby;

  Profile({
    required this.name,
    required this.id,
    required this.dob,
    required this.hobby,
    required this.profession,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json["name"],
      id: json["id"],
      dob: json["dob"],
      hobby: json["hobby"],
      profession: json["profession"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "dob": dob,
      "hobby": hobby,
      "profession": profession,
    };
  }

  Profile copyWith({
    String? id,
    String? name,
    String? profession,
    String? dob,
    String? hobby,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      profession: profession ?? this.profession,
      dob: dob ?? this.dob,
      hobby: hobby ?? this.hobby,
    );
  }
}
