void main() {
  List<int> scores = [45, 88, 72, 91, 33, 67, 58];

  var passingScores = scores.where((score) => score >= 50).toList();

  var grades =
      passingScores.map((score) => score >= 85 ? 'A' : 'B').toList();

  var total = scores.reduce((a, b) => a + b);
  var average = total / scores.length;

  print('Passing scores: $passingScores');
  print('Grades: $grades');
  print('Class average: $average');
}
