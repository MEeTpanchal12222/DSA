import 'dart:math';
/*
Simple solution | O(n) time complexity | O(1) space complexity
*/
class Solution {
  int maxProfit(List<int> prices) {
    int profit = 0;
    int minPrice = prices.first;
    for (int i = 1; i < prices.length; i++) {
      minPrice = min(minPrice, prices[i]);
      profit = max(profit, prices[i] - minPrice);
    }
    return profit;
  }
}

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.maxProfit([7, 1, 5, 3, 6, 4])); // Output: 5
  print(solution.maxProfit([7, 6, 9, 3, 1]));    // Output: 2
}
