class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String rating;
  final String releaseDate;
  final String catogery;
  final String bookUrl;
  final bool isFree;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.releaseDate,
    required this.rating,
    required this.catogery,
    required this.bookUrl,
    this.isFree = false,
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
      bookUrl: map["buyUrl"] ?? "",
      isFree: map["isFree"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'description': description,
      'rating': rating,
      'releaseDate': releaseDate,
      'catogery': catogery,
      'buyUrl': bookUrl,
      "isFree": isFree,
    };
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
