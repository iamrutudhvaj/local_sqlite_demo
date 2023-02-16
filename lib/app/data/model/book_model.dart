class Book {
  Book({
    this.name,
    this.author,
    this.id,
  });

  final String? name;
  final String? author;
  final int? id;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        name: json["name"],
        author: json["author"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {"name": name, "author": author};
}
