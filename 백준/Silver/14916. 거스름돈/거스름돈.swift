let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N + 1)

if N == 1 {
    print(-1)
} else {
    for i in 2...N {
        if i >= 5 && (i % 5 == 0 || (i - 5) % 2 == 0) {
            dp[i] = dp[i - 5] + 1
        } else if i % 2 == 0 {
            dp[i] = dp[i - 2] + 1
        } else {
            dp[i] = -1
        }
    }
    print(dp[N])
}
