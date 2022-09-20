class GameDataResponseModel {
  final int id;
  final String name;

  GameDataResponseModel({required this.id, required this.name});

  factory GameDataResponseModel.fromJson(Map<String, dynamic> json) {
    return GameDataResponseModel(
        id: json["id"] ?? "", name: json["name"] ?? "");
  }
}
