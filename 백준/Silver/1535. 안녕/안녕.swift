let N = Int(readLine()!)!
var powerArr = readLine()!.split{$0 == " "}.map{Int($0)!}
var joyArr = readLine()!.split{$0 == " "}.map{Int($0)!}
// dp[i][j] = 체력이 j일때 i번째 사람까지 최대 기쁨
var dp = Array(repeating: Array(repeating:0,count:100), count: N + 1)

for i in 1...N {
    for j in 1...99 {
        if j < powerArr[i - 1] {
            dp[i][j] = dp[i - 1][j]
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - powerArr[i - 1]] + joyArr[i - 1])
        }
    }
}

print(dp[N][99])
