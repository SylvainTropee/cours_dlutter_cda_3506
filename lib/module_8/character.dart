class Character {
  String name;
  String imageUrl;

  Character({required this.name, required this.imageUrl});

  Character.fromJson(Map<String, dynamic> json)
    : this.name = json['name'],
      this.imageUrl = json['image'];
}
