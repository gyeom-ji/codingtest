import Foundation
var bLocation = [[Bool]]()


func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    var dp = Array(repeating: Array(repeating: false, count: m), count: n)
    var result = Int.max
    dp[0][0] = true
    
    for i in 0..<info.count {
        let aVal = info[i][0]
        let bVal = info[i][1]
        var dp2 = Array(repeating: Array(repeating: false, count: m), count: n)
        
        for a in 0..<n {
            for b in 0..<m {
                if dp[a][b] {
                    if n > a + aVal {
                        dp2[a + aVal][b] = true
                    }
                    if m > b + bVal {
                        dp2[a][b + bVal] = true
                    }
                }
            }
        }
        dp = dp2
    }
    for a in 0..<n {
        for b in 0..<m {
            if dp[a][b] {
                result = min(result, a)
            }
        }
    }
    return result >= n ? -1 : result
}
