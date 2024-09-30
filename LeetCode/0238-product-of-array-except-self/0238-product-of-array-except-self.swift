class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var anw = [Int]()
        var cnt = nums.count
        var left = Array(repeating: 1, count: cnt)
        var right = Array(repeating: 1, count: cnt)

        for i in 1..<cnt {
            left[i] = left[i - 1] * nums[i - 1]
        }

        for i in (0..<cnt - 1).reversed() {
            right[i] = right[i + 1] * nums[i + 1]
        }

        for i in 0..<cnt {
            anw.append(left[i] * right[i])
        }

        return anw
    }
}