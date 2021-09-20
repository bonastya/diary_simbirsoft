class Deal{
  int id;
  String color;
  int time_start;
  int time_finish;
  int date;
  String name;
  String description;

  Deal({
    required this.id,
    required this.color,
    required this.time_start,
    required this.time_finish,
    required this.date,
    required this.name,
    required this.description
  });


  Map<String, dynamic> toJson() => {
    'id': id,
    'color': color,
    'time_start': time_start.toString(),
    'time_finish': time_finish.toString(),
    'date': date.toString(),
    'name': name,
    'description': description
  };

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
        id: json['id'],
        color: json['color'],
        time_start: json['time_start'],
        time_finish: json['time_finish'],
        date: json['date'],
        name: json['name'],
        description: json['description']
    );
  }

}