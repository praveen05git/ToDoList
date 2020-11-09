class Category {
  int id;
  String name;
  String description;

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['ID'] = id;
    mapping['NAME'] = name;
    mapping['DESC'] = description;
    return mapping;
  }
}
