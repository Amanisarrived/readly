class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String rating;
  final String releaseDate;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.releaseDate,
    required this.rating,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map["description"] ?? "",
      rating: map["rating"] ?? "",
      releaseDate: map["releaseDate"] ?? "",
    );
  }
}
