class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};

    for (int i = 0; i < nums.length; i++) {
      int currentNum = nums[i];
      int complement = target - currentNum;

      if (map.containsKey(complement)) {
        return [map[complement]!, i];
      }

      map[currentNum] = i;
    }

    throw Exception("No solution found!");
  }
}
