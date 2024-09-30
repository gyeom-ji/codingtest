class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var anw = 0
        var cnt = 0
        var dict = [0 : -1]

        for i in 0..<nums.count {
            cnt += nums[i] == 1 ? 1 : -1 

            if let prevIndex = dict[cnt] {
                anw = max(anw, i - prevIndex)
            } else {
                dict[cnt] = i
            }
        }
        return anw
    }
}