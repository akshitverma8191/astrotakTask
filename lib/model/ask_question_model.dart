class AskQuestionModel {
  late int id;
  String? name;
  String? description;
  late double price;
  late List<dynamic> suggestions;
  AskQuestionModel(Map object) {
    id = object["id"];
    name = object["name"];
    description = object["description"];
    price = object["price"];
    suggestions = object["suggestions"];
  }
}
