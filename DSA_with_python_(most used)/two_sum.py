class Solution(object):
    def twoSum(self, nums , target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        num_to_index = {}
        for i,num in enumerate(nums):
         complement = target - num
         if complement in num_to_index :
            return [num_to_index[complement],i]
            
         num_to_index[num] = i


# Example usage:
solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))  # Output: [0, 1]