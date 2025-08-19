#
# @lc app=leetcode id=121 lang=python3
#
# [121] Best Time to Buy and Sell Stock
#

# @lc code=start



class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        min_price = prices[0]
        max_profit = 0
        for price in prices:
            if price < min_price:
                min_price = price
            elif price - min_price > max_profit:
                max_profit = price - min_price
        return max_profit
# @lc code=end

# Example usage:
solution = Solution()
print(solution.maxProfit([7, 1, 5, 3, 6, 4]))  # Output: 5
print(solution.maxProfit([7, 6, 9, 3, 1]))    # Output: 2