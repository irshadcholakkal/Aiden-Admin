



class Categories {
  final String id;
  final String field;

  Categories({
    required this.id,
    required this.field,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      field: json['field'],
    );
  }
}
