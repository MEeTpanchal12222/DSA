/*
 * @lc app=leetcode id=217 lang=cpp
 *
 * [217] Contains Duplicate
 */

// @lc code=start
#include <vector>
#include <iostream>
#include <unordered_set>
using namespace std;
class Solution {
public:
    bool containsDuplicate(const vector<int>& nums) {
        unordered_set<int> seen;
        printf("Checking for duplicates in the array...\n");
        for (int num : nums) {
            if (seen.count(num)) {
                return true; // Duplicate found
            }
            seen.insert(num);
        }
        return false; // No duplicates found
    }
};
// @lc code=end

