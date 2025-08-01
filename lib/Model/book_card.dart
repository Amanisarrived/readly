class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String rating;
  final String releaseDate;
  final String catogery;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.releaseDate,
    required this.rating,
    required this.catogery,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map["description"] ?? "",
      rating: map["rating"] ?? "",
      releaseDate: map["releaseDate"] ?? "",
      catogery: map["catogery"] ?? "",
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode => title.hashCode ^ author.hashCode ^ releaseDate.hashCode;
}
