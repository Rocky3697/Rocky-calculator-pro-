class HistoryItem {
  final String equation;
  final String result;
  final DateTime dateTime;

  HistoryItem({required this.equation, required this.result, required this.dateTime});

  Map<String, dynamic> toMap() => {
    'equation': equation,
    'result': result,
    'dateTime': dateTime.toIso8601String(),
  };

  factory HistoryItem.fromMap(Map<String, dynamic> map) => HistoryItem(
    equation: map['equation'],
    result: map['result'],
    dateTime: DateTime.parse(map['dateTime']),
  );
}
