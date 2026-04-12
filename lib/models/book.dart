class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final String pdfUrl;
  final int totalPages;
  final int currentPage;
  final bool isQuizLocked;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.pdfUrl,
    required this.totalPages,
    this.currentPage = 0,
    this.isQuizLocked = true,
  });
}
