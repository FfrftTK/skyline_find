void main() {
  List<List<num>> points = [
    [14, 6],
    [30, 12],
    [17, 8],
    [19, 4],
    [22, 10],
    [18, 1],
    [16, 14],
  ];
  var compareCounts = 0;
  print(points);
  List<List<num>> skyLinePoints = [];

  skyLinePoints.add(points.removeAt(0));

  points.forEach((p) {
    skyLinePoints.firstWhere((sl) {
      compareCounts++;
      print('($p, $sl)');
      return isDominated(p, sl);
      }, orElse: () {
      return null;
      }) ?? skyLinePoints.add(p); 
  });
  print('Sky Line Points: $skyLinePoints');
  print('Compared $compareCounts Times.');
}

// return wheather a is dominated by b
bool isDominated(List<num> a, List<num> b){
  final length = a.length;
  if(length != b.length){
    return false;
  }
  var res = <bool>[];
  for(var i = 0; i < length; i++){
    res.add(a[i] > b[i]);
  }
  return res.firstWhere((e) => !e, orElse: () => true);
}


