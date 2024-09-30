class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var anw = 0
        var left = 0, right = 0
        var sum = 0, cnt = nums.count

        while left < cnt {
            sum += nums[right]

            if sum == goal {
                anw += 1
            } 

            right += 1
            
            if sum > goal || right == cnt {
                sum = 0
                left += 1
                right = left 
            }
        }
        return anw
    }
}