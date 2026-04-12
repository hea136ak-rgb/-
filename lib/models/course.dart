class Course {
  final String id;
  final String title;
  final String category; // Programming, Design, etc.
  final String source; // Maaref, Edraak
  final List<String> videoUrls;
  final int totalLessons;
  final int completedLessons;

  Course({
    required this.id,
    required this.title,
    required this.category,
    required this.source,
    required this.videoUrls,
    required this.totalLessons,
    this.completedLessons = 0,
  });
}
