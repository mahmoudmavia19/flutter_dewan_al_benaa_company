class Project {
  int id;
  double cost;
  String entity;
  String investor;
  String description;

  Project({
    required this.id,
    required this.cost,
    this.entity = '',
    this.investor = '',
    required this.description,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      cost: json['cost'].toDouble(), // Adjust if needed
      entity: json['entity'] ?? '',
      investor: json['investor'] ?? '',
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cost': cost,
      'entity': entity,
      'investor': investor,
      'description': description,
    };
  }
}