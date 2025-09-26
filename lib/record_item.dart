class RecordItem {
  String title;
  String description;
  int funded;
  int goals;
  int endsIn;
  String image;
  bool liked;

  RecordItem({
    required this.title,
    required this.description,
    required this.funded,
    required this.goals,
    required this.endsIn,
    required this.image,
    this.liked = false,
  });
}
