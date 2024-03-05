class TeatmeItem {
  final int id;
  final String title;
  final int male;
  final int female;

  TeatmeItem({
    required this.id,
    required this.title,
    required this.female,
    required this.male,
  });

  factory TeatmeItem.fromJson(Map<String, dynamic> json) {
    return TeatmeItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      male: json['male'] ?? 0,
      female: json['female'] ?? 0,
    );
  }
}
