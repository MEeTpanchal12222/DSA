import 'dart:math' as Math;

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    List<List<int>> result = [];
    for (var element in intervals) {
      if (element[1] < newInterval[0] || element[0] > newInterval[1]) {
        result.add(element);
      } else {
        newInterval = [Math.min(element[0], newInterval[0]), Math.max(element[1], newInterval[1])];
      }
    }
    result.add(newInterval);
    return result..sort((a, b) => a[0].compareTo(b[0]));
  }
}
