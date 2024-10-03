let T = Int(readLine()!)!
var anw = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    let count = N < 3 ? 4 : N + 1
    var dp = Array(repeating: 0, count:count)
    
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    if N > 3 {
        for i in 4...N {
            dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
        }
    }
    
    anw += "\(dp[N])\n"
}

print(anw)
