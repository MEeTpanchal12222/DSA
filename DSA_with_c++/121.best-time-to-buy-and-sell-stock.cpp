/*
 * @lc app=leetcode id=121 lang=cpp
 *
 * [121] Best Time to Buy and Sell Stock
 */
#include <vector>
#include <climits>
using namespace std;
// @lc code=start
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int min_price = INT_MAX;
        int max_profit = 0;

        for (int price : prices) {
            if (price < min_price) {
                min_price = price; // Update the minimum price
            } else if (price - min_price > max_profit) {
                max_profit = price - min_price; // Update the maximum profit
            }
        }

        return max_profit; // Return the maximum profit found
        
    }
};
// @lc code=end

